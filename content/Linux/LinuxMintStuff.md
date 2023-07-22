# Linux Mint Stuff

## Upgrade from Vera to Victoria

```sh
$ sudo apt-get update
$ sudo apt-get dist-upgrade
$ sudo timeshift --create
$ sudo timeshift --list
$ vi /etc/apt/sources.list.d/official-package-repositories.list
:s/vera/victoria/g
$ sudo apt-get update
$ sudo apt-get dist-upgrade
$ sudo systemctl reboot
```
