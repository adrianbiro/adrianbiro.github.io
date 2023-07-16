# Automation Stuff Jenkins, docker-compose, Githubactions

## Jenkins
Copy modules from Jenkins parameters, then in PowerShell run this, search, with the string that will return, in Kibana (Lucene mode). 
```powershell
"http.response.status_code: [499 TO 600] AND container.name : (" + $((Get-Clipboard -Raw) -replace "\n", "* OR ") + "*)"
```
### Backup Jenkins metadata
There is a better way to do it, yes, but when you are in a strangely setup environment, where you cant acces manage jenkins session, but you have control over claster where is runs, it is what you can do.

First run this as free style pipeline periodicaly.
```sh
#!/bin/bash
set -euxo pipefail
cd "$(git rev-parse --show-cdup)jenkins_bkp"
oc project smart-deva
oc rsync --include="config.xml" --exclude="/*/*/,state.xml,nextBuildNumber" --delete=true $(oc get pod | awk '/jenkins/&&!/agent/{print $1}'):/var/lib/jenkins/jobs/smartcase/jobs/ bkp/
echo -e "---------------------------------------------------------------\nGIT"
cd "$(git rev-parse --show-toplevel)"
git status -sb
if (( $(git diff | wc -l) > 0 )); then
	git add --all
	git commit --allow-empty -m "jenkins bkp"
	git push origin HEAD:master
else
	echo -e "\nNothing to commit, working tree clean."
fi
```
Prepare Jenkins for the restart without full admin access. 

Delete Jenkins job queue with `java -jar jenkins-cli.jar -s https://jenkins-<org>/ -webSocket clear-queue` or `Groovy`
```groovy
/*
https://jenkins-<org>/script
*/
Jenkins.instance.queue.clear()
```
Delete all agents: `oc delete pod $(oc get pod -o wide | awk '/jenkins-ocp3-agent/{print $1}')`

Restore backup created by free style pipeline to `/var/lib/jenkins/jobs/<namespace>/jobs`

Deploy jenkins: `oc rollout latest dc/jenkins`

In case of any problem with the deployment: 

`oc rollout retry dc/jenkins`

`oc rollout cancel dc/jenkins`


## Combine `docker-compose` with python app
```sh
#!/bin/bash
docker-compose -f services/docker-compose.yml up --build -d
if [[ ! -d /tmp/venv ]]; then
    echo "Creating venv in /tmp/venv"
    python3 -m venv /tmp/venv
fi
source /tmp/venv/bin/activate
pip install -r /src/requirements.txt

while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:9070/health)" != "200" ]]; do
    sleep 5
    echo "waiting for service to come online"
done

python3 /src/main.py

# docker-compose -f services/docker-compose.yml down
```
