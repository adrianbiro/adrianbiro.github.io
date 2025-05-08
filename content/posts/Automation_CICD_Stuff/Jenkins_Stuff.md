+++
title = 'Jenkins Stuff'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['jenkins', 'CI/CD', 'automation CI/CD stuff']
+++
# Jenkins Stuff

Copy modules from Jenkins parameters, then in PowerShell run this, search, with the string that will return, in Kibana (Lucene mode).

```powershell
"http.response.status_code: [499 TO 600] AND container.name : (" + $((Get-Clipboard -Raw) -replace "\n", "* OR ") + "*)"
```

## Backup Jenkins metadata

There is a better way to do it, but when you are in a strangely setup environment, where you can't acces jenkins session, but you have control over the cluster, this is what you can do.

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

## Delete old builds

`find ./*/builds  -maxdepth 1  -type d -mtime +3 -name "[0-9]*" -exec rm -rf {} \;`

## Run all Build jobs

```groovy
/*Not in Groovy Sandbox*/
import jenkins.model.*
import hudson.model.*
  
def dirname = "smartcase/Build"
def allJobs = hudson.model.Hudson.getInstance().getAllItems(Job.class).findAll { it.getFullName().contains(dirname) }
def matchedJobs =  allJobs.findAll { job ->  job.name =~ /master$/ }

matchedJobs.each { job ->
    if(! job.toString().contains('Build all modules')){
    println "Scheduling matching job ${job.name}"
    job.scheduleBuild(new Cause.UserIdCause())
    }
}
```
