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