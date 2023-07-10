# Notes on Miscelaneus Unix Utils

## file
```sh
$ file  weblogic-sys_zfin_zfin_time_2023-07-09_15\:02\:12.230374 
 weblogic-sys_zfin_zfin_time_2023-07-09_15:02:12.230374: ELF 64-bit LSB core file, x86-64, version 1 (SYSV), too many program headers (4210)
$ ls -lh
-rw-r--r--   1 root   root    21G Jul  9 15:04  weblogic-sys_zfin_zfin_time_2023-07-09_15:02:12.230374
$ file -Pelf_phnum=10000  weblogic-sys_zfin_zfin_time_2023-07-09_15\:02\:12.230374
 weblogic-sys_zfin_zfin_time_2023-07-09_15:02:12.230374: ELF 64-bit LSB core file, x86-64, version 1 (SYSV), SVR4-style, from '/usr/lib/firefox/irefox'
```
Look inside compressed files
```sh
$ file stage.pcap.zst 
stage.pcap.zst: Zstandard compressed data (v0.8+), Dictionary ID: None
$ file stage.pcap.zst --uncompress
stage.pcap.zst: pcap capture file, microsecond ts (little-endian) - version 2.4 (Ethernet, capture length 262144) (Zstandard compressed data (v0.8+), Dictionary ID: None)
```
