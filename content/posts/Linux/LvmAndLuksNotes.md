+++
title = 'LVM And LUKS Notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['encryption', 'linux', 'luks']
+++
# LVM And LUKS Notes

## Dm-Crypt, LUKS, VeraCrypt

[VeraCrypt How-To](https://wiki.archlinux.org/title/VeraCrypt)

[dm-crypt/Encrypting a non-root file system](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_a_non-root_file_system)

## Run-book how to extend encrypted logical volumes

### Extend LVM LUKS
[link](https://www.golinuxcloud.com/resize-luks-partition-shrink-extend-decrypt/)
### LVM
```sh
$ lsblk
$ wipefs -a /dev/sdb
  # quick wipe target device
$ pvcreate /dev/sdb
$ pvs
$ vgs
$ vgextend ubuntu-vg /dev/sdb
$ vgs
$ lvs
$ lvcreate -n secret -L 10G ubuntu-vg
$ lvs
```
### LUKS init
```sh
$ cryptsetup luksFormat /dev/ubuntu-vg/secret
  # take a time
$ cryptsetup luksOpen /dev/ubuntu-vg/secret secret
  # password
$ mkfs.ext4 /dev/mapper/secret
$ mkdir /secret # on / not /mnt/
$ mount /dev/mapper/secret /secret/
$ mount | grep secret
```
### resize LUKS
```sh
$ df -h /secret/
$ blkid -t TYPE=crypto_LUKS -o device
  # to list LUKS devices
$ cryptsetup status secret
$ umount /secret
$ cryptsetup luksClose secret
$ lvextend -L +10G /dev/ubuntu-vg/secret
$ lvs
$ cryptsetup luksOpen /dev/ubuntu-vg/secret secret
  # password
$ cryptsetup status secret
```
### test
```sh
$ e2fsck -f /dev/mapper/secret
$ resize2fs -p /dev/mapper/secret
$ mount /dev/mapper/secret /secret/
$ df -h /secret/
```
### Backup
[fsarchiver](https://www.fsarchiver.org/quickstart/)
or just `rsync -rauvlPL`
