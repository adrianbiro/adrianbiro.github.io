+++
title = 'Cmd notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['windows', 'cmd']
+++
# Cmd notes
* COPY - cp 
* DIR - ls 
* DEL or ERASE - rm
* [EXPAND](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/expand) - unzip
* FC - diff
* [FIND](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/find) - grep
* [FORFILES](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/forfiles) - find 
* MD - mkdir
* MOVE - mv
* RD or RMDIR - rmdir
* REN or RENAME - mv
* [ROBOCOPY](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy) - cp
* TREE - tree
* TYPE - cat
* [OPENFILES](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/openfiles) – Manages opened local or network files
* [XCOPY](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/xcopy) - cp -r

## Process
* SCHTASKS - Task Scheduler
* SHUTDOWN - shutdown
* TASKLIST - systemctl list-jobs
* TASKKILL - kill
* RUNAS - su

## Disks
* CHKDISK - Checks disk and shows statistics
* DEFRAG – Starts disk defragmentation
* DRIVERQUERY - Displays the current state and properties of the device driver
* CHKNTFS - Displays or changes execution of disk check at boot
* COMPACT - Displays and change the compression of files in NTFS partitions
* CONVERT - Converts FAT disk volume to NTFS
* DISKPART - gpart
* FORMAT - Formats the disk
* FSUTIL - Displays and configures file system properties
* LABEL - Creates, changes, or deletes a disk volume label
* RECOVER - Recovers data from a bad or damaged disk
* VOL - Displays volume label and serial number for the disk

## Sysinfo
* DATE - date
* TIME - date
* HOSTNAME - hostname
* SYSTEMINFO - dmidecode, neofetch, lscpu 
* VER - uname -a
* GPRESULT – Displays current applied group policies (RSoP)

## Networking
* IPCONFIG - ifconfig
* PING – ping
* TRACERT - traceroute
* NSLOOKUP - host, nslookp, dig
* ROUTE - route
* ARP- arp
* [NETSH](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/netsh) – Network settings control program
* GETMAC - (Shows the MAC address)  ip link show, ifconfig -a

