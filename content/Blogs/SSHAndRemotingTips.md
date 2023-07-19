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