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
## wget
Download files in batch.
```sh
$ wget --no-verbose --no-parent --recursive --level=1 --no-directories --no-clobber --continue ${URL}
$ wget -r l 7 --convert-links ${URL}
```
Download specific file names.
```sh
$ wget -A '*.ps -r ${URL}
```
Download full sile.
```sh
$ wget --mirror --convert-links ${URL}
```
Debug, `-S` server response
```sh
$ wget --debug --server-response --max-redirect 0 ${URL}
```
## grep
Generate `.env` file from `docker-compose.yaml`
```yaml
environment:
  - "INFLUXDB_ADMIN_USER=${INFLUXDB_ADMIN_USER:-admin}"
```
```sh
$ grep -oP '(?<=\${).*(?=})' docker-compose.yaml | sed -E "s/(.*):-(.*)/\1\='\2'/"
INFLUXDB_ADMIN_USER='admin'
```
Select numbers 3 plus digits long, and ignore zero padding, if it is present. Print all matches, on separate lines.
```sh
$ grep -woP '0*+\d{3,}' <<< '0320 0045 123 45 89 654654' 
0320
123
654654
```
[Asciigraph](https://github.com/guptarohit/asciigraph) plus this grep feature is nice when you need to parse and plot the output of monitoring solutions that put all data for one event (like deployments) into one line.
```sh
$ grep -woP '0*+\d{3,}' <<< '0320 0045 123 45 89 654' --line-buffered  | asciigraph  -h 10 -w 80 
 654 ┤                                                                           ╭───
 601 ┤                                                                       ╭───╯
 548 ┤                                                                   ╭───╯
 495 ┤                                                               ╭───╯
 443 ┤                                                           ╭───╯
 390 ┤                                                       ╭───╯
 337 ┼─────╮                                             ╭───╯
 284 ┤     ╰──────────╮                               ╭──╯
 231 ┤                ╰──────────╮                ╭───╯
 178 ┤                           ╰─────────╮  ╭───╯
 125 ┤                                     ╰──╯
```
* `-o` Print only the matched parts of a matching line.
* `-w` Select only those lines containing matches that form whole words/regex.
* `-P` Perl-compatible regular expression

## curl 
Logging in script.
```sh
$ curl --silent --fail --show-error www.postman-echo.com/delete
curl: (22) The requested URL returned error: 404
```

## date
```sh
$ date --iso-8601=seconds
2023-07-16T19:16:25+02:00
```