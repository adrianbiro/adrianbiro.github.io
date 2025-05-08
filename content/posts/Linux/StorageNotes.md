+++
title = 'Storage notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['hardware', 'storage', 'linux']
+++
# Storage notes

## [SCSI disk format](https://linux.die.net/man/8/sg_format)

`sg_format --format /dev/sdX` It take time!
It is useful when failing to read, but not write. Rationale: the device was in the disk array controller before.

Check `dmesg`
```sh
$ dmesg
blk_update_request: protection error
```

## Convert the Sector Size

```sh
sg_format -v --format --size=512 /dev/sdX
```
 
 ## Get Serial Number for Disks

 ```sh
$ lsblk --nodeps -o name,serial
$ lsblk --nodeps -no serial /dev/sdX
$ udevadm info --query=all --name=/dev/sdX | grep ID_SERIAL
```
##  SSD Health on Windows

```ps1
Get-PhysicalDisk -DeviceNumber 0 | Get-StorageReliabilityCounter | Select-Object DeviceId, Temperature, Wear
```

