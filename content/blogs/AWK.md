# AWK tips

## Generate completion
For `ssh` and `sftp`
```sh
complete -W "$(awk '/^Host\s\*/{next}; /^Host/{print $2}' "${HOME}/.ssh/config" 2>'/dev/null')" ssh sftp
```
Get specific device for `iostat -p sdX`
```sh
alias ,iostat='iostat -xmdzh 1 -p'
complete -W "$(lsblk -l | awk '!(/loop/||/NAME/){print $1}')" ,iostat
```
Basic competion for yt-dlp
```sh
complete -W "$(yt-dlp -h | awk '$1 ~ /--.*/&&!/sponsorblock/{print $1}')" yt-dlp
```

## k8s ocp
Remote to the container without knowing generated suffix
```sh
oc rsh $(oc get pod | awk '/jenkins/&&!/agent/{print $1}')
```

Filter pods on specific conditions
```bash
# Pods Ready
oc get pods -o wide | awk 'NR==1{print; next} {split($2, arr, "/"); if(arr[1] != arr[2]) print}'
# Pods Restarts
oc get pods -o wide | awk 'NR==1{print; next} {if($4 > 0) print}'
# Pods Age
oc get pods -o wide | awk -v days="${1:-7}" 'NR==1{print; next} $5!~/.*d/{next}; {tmp=$5; gsub("d","",tmp); if(int(tmp) > days ){print}}'
```
## Log4J
Parse the whole log entry, not just the line containing the error string (record in AWK)
```sh
#!/bin/bash
set -o errexit
set -o pipefail
awk '/^[0-3]?[0-9].[0-3]?[0-9].(?:[0-9]{2})?[0-9]{2}.*$/{print "\n" $0; next}{print}' "${1}" |
  awk 'BEGIN{RS=""}/java.lang.NullPointerException/'
```
## Mix 
Get a scpecific network interface
```sh
sudo tcpdump -i $(ip addr | awk -F':' '/^[1-9]/&&/wlp/{print $2})' udp -v
```
Kill all detached screens
```sh
screen -ls | awk '/Detached/{print $1}' | xargs -I{} screen -X -S {} quit
```
Validate `base64` [base64 padding](https://stackoverflow.com/questions/6916805/why-does-a-base64-encoded-string-have-an-sign-at-the-end)
```sh
$ echo YXNkcQo= | base64 -d
asdq
$ echo YXNkcQo | base64 -d
asdq
base64: invalid input
$ echo YXNkcQo= | awk '{if (length % 4 == 0){print}}' | base64 -d 
asdq
$ echo YXNkcQo | awk '{if (length % 4 == 0){print}}' | base64 -d 
$
```
## Insert env variable to docker
```awk
#!/usr/bin/awk -f
BEGIN{
    FS="=";
    while ("env" | getline) {
        if(/^(WSL|XDG)_.*$/){
            printf("-e %s\n", $1)
        }
    }
}
```
```bash
$ ./,insertEnvVars.awk
-e XDG_SESSION_TYPE
-e XDG_SEAT_PATH
-e XDG_SESSION_CLASS
$ docker run -it $(./,insertEnvVars.awk) --rm alpine env
  ...
```

## Extract code blocks from markdown
```awk
#!/usr/bin/awk -f

BEGIN {
    if (ARGC > 1) {             # set search string to the first argument
        arg = ARGV[1];          # extract.awk sql sql.md
        delete ARGV[1];         # to get related snippets in more languages
        patern = "^```" arg     # extract.awk '(python|sql)' sql.md
    }
}

{
    if ($0 ~ patern) {
        printLine = 1
#        print ""               # to separate snippets with a line, uncomment this
        }
    else if ($0 ~ /^```/){
        if (printLine == 1) {
            gsub(/^.*$/, "```")
            print #""           # this
        }
        printLine = 0
        }
    if (printLine) {
#        gsub(patern, "")       # to remove markdown code marks uncomment this line and quotes above
        print
    }
}
```
Examples of what it does.

 `./extract.awk '(python|sql)' sql.md`
 ```sql
 CREATE TABLE IF NOT EXISTS person (
     person_id SERIAL PRIMARY KEY,
     fname VARCHAR(50) UNIQUE NOT NULL,
     lname VARCHAR(50) NOT NULL,
     age INT,
     date_of_join TIMESTAMP DEFAULT '2000-01-16 19:10:25-07',
     is_real BOOL DEFAULT FALSE

 );
 ```
 ```python
  import psycopg2

 connection = create_connection(
     "sm_app", "postgres", "passwd", "127.0.0.1", "5432"
 )
 ```

