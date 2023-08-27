# SSH and remoting tips

## RDP
[man freerdp](https://github.com/awakecoding/FreeRDP-Manuals/blob/master/User/FreeRDP-User-Manual.markdown)
```sh
freerdp /u:<Name> /p:<Password> /d:<ad.domain.com> /v:<ip_addr> /w:1920 /h:1080 /fonts /smart-sizing
```
```bash
function ,freerdp(){
  freerdp /w:1920 /h:1080 /fonts /smart-sizing "${@}"
}
```

## SFTP

```
sftp <user>@<host>
lls; lcd; lpwd
put local2remote.log  
get remote2local.log
quit
```
## SSH

Jump host
```sh
$ ssh -A -J <user>@<host2> <host1>
```
[Forward Agent problems](https://www.qualys.com/2023/07/19/cve-2023-38408/rce-openssh-forwarded-ssh-agent.txt)
```conf
Host <host1>
    User <user>
    HostName <fullhostname>
    ProxyJump <user>@<host2>
    ForwardAgent yes
```

`remote2clipboard.sh`
on server 
```sh
$ mkfifo ~/clip
$ grep 'ERROR' file.log > ~/clip
```
on client
```sh
#!/bin/sh
ssh <hostname> 'cat clip' | xclip -selection clipboard #clip on win
```

Ignore pre-authentication banner message from server:
```sh
$ ssh -o LogLevel=error <user@host>
```
Limits the used bandwidth for csp, specified in Kbit/s.
```sh
$ scp -l 8500 server:/file .
```

Tunel db via socket to localhost 
```sh
$ ssh -N -L 1234:/var/run/mysqld/mysqld.sock user@dbhost
```

## Links

[Remote Access Policy](https://www.stigviewer.com/stig/remote_access_policy/)

[Hardening OpenSSH server Mozilla](https://infosec.mozilla.org/guidelines/openssh)

[Hardening OpenSSH client Digitalocean](https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-client-on-ubuntu-18-04)