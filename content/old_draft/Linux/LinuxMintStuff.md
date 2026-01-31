+++
title = 'Linux Mint Stuff'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['linux','mint']
+++
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

## Skylink `Přehrávání videa je zakázáno. (W823)`

```bash
sudo apt install ubuntu-restricted-extras chromium-codecs-ffmpeg-extra
```

DRM in chrome

`chrome://settings/content/protectedContent`

<https://www.parabola.cz/forum/topic-105617/>

<https://forum.ubuntu.cz/index.php?topic=83870.0>
