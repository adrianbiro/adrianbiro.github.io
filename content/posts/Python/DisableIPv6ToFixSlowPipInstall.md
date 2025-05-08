+++
title = 'Disable IPv6, to fix slow pip install'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['python']
+++
# Disable IPv6, to fix slow pip install.

List current values.
```sh
$ sysctl net.ipv6.conf.all.disable_ipv6
net.ipv6.conf.all.disable_ipv6 = 0
$ sysctl net.ipv6.conf.default.disable_ipv6
net.ipv6.conf.default.disable_ipv6 = 0
```
Or on the wifi `net.ipv6.conf.wlp0s20f3.disable_ipv6` interface. List all interfaces with `netstat -i`
```sh
$ sysctl net.ipv6.conf.eth0.disable_ipv6 
net.ipv6.conf.eth0.disable_ipv6 = 0
```
Set `1` to disable.
```sh
$ sysctl net.ipv6.conf.all.disable_ipv6=1
$ sysctl net.ipv6.conf.default.disable_ipv6=1
$ sysctl net.ipv6.conf.eth0.disable_ipv6=1
```

To make it persistent append variable `GRUB_CMDLINE_LINUX` in `/etc/default/grub` 

[Grub2 setup Ubuntu docs](https://help.ubuntu.com/community/Grub2/Setup) 

[GRUB Arch Wiki](https://wiki.archlinux.org/title/GRUB)
```sh
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```
Update `grub` settings with `grub2-mkconfig -o /boot/grub2/grub.cfg`

