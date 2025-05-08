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
wget --no-verbose --no-parent --recursive --level=1 --no-directories --no-clobber --continue ${URL}
wget -r l 7 --convert-links ${URL}
```

Download specific file names.

```sh
wget -A '*.ps' -r ${URL}
```

Download full sile.

```sh
wget --mirror --convert-links ${URL}
```

Debug, `-S` server response

```sh
wget --debug --server-response --max-redirect 0 ${URL}
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

Make direct requests at a specific server, e.g. at a specific cluster node in a cluster of servers, or to workaround certificate errors, without using `-k --insecure` flags. [Debugging Certificate Errors](https://www.netmeister.org/blog/debugging-certificate-errors.html)

```sh
curl --connect-to www.example.com:443:cname.example.com:443 https://www.example.com
```

## date

```sh
$ date --iso-8601=seconds
2023-07-16T19:16:25+02:00
```

Seconds since the last modification time of FILE

```sh
$ echo "$(( $(date +%s) - $(date -r ${file} +%s) ))"
47195
```

## jar

Like the [TAR(1)](https://man.freebsd.org/cgi/man.cgi?query=tar&apropos=0&sektion=0&manpath=FreeBSD+13.2-RELEASE+and+Ports&arch=default&format=html).

```sh
jar -tf file.jar
```

```sh
$ jar --help
Picked up JAVA_TOOL_OPTIONS:  -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom -Djavax.net.ssl.trustStore=/etc/pki/java/cacerts -Djavax.net.ssl.trustStorePassword=25bad398-d74f-11ec-aabd-00505693bf45 -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2
Illegal option: -
Usage: jar {ctxui}[vfmn0PMe] [jar-file] [manifest-file] [entry-point] [-C dir] files ...
Options:
    -c  create new archive
    -t  list table of contents for archive
    -x  extract named (or all) files from archive
    -u  update existing archive
    -v  generate verbose output on standard output
    -f  specify archive file name
    -m  include manifest information from specified manifest file
    -n  perform Pack200 normalization after creating a new archive
    -e  specify application entry point for stand-alone application 
        bundled into an executable jar file
    -0  store only; use no ZIP compression
    -P  preserve leading '/' (absolute path) and ".." (parent directory) components from file names
    -M  do not create a manifest file for the entries
    -i  generate index information for the specified jar files
    -C  change to the specified directory and include the following file
If any file is a directory then it is processed recursively.
The manifest file name, the archive file name and the entry point name are
specified in the same order as the 'm', 'f' and 'e' flags.

Example 1: to archive two class files into an archive called classes.jar: 
       jar cvf classes.jar Foo.class Bar.class 
Example 2: use an existing manifest file 'mymanifest' and archive all the
           files in the foo/ directory into 'classes.jar': 
       jar cvfm classes.jar mymanifest -C foo/ .
```

## numfmt

Convert bytes to Human readable format

```bash
$ numfmt --to=iec --suffix=B --padding=7 1048576
  1,0MB
```

## brotli

[Brotli Compressed Data Format RFC](https://datatracker.ietf.org/doc/html/rfc7932)

[Brotli Wiki](https://en.wikipedia.org/wiki/Brotli)

[Blorli Github](https://github.com/google/brotli)

1. Compress a file, creating a compressed version next to the file:

`# brotli file.txt`

1. Decompress a file, creating an uncompressed version next to the file:

`# brotli -d file.txt.br`

1. Compress a file specifying the output filename:

`# brotli file.txt -o compressed_file.txt.br`

1. Decompress a Brotli file specifying the output filename:

`# brotli -d compressed_file.txt.br -o file.txt`

1. Specify the compression level. 1=Fastest (Worst), 11=Slowest (Best):

`# brotli -q 11 file.ext -o compressed_file.ext.br`

## logger

[man(1) logger](https://www.man7.org/linux/man-pages/man1/logger.1.html)

`--server remoteIP`

`--priority user.err`

| Facility Name | Level Name |
|--------------|------------|
| auth         | emerg      |
| authpriv     | alert      |
| cron         | crit       |
| daemon       | err        |
| ftp          | warning    |
| kern         | notice     |
| lpr          | info       |
| mail         | debug      |
| news         | panic      |
| syslog       | error      |
| user         | warn       |
| uucp         |            |
| local0       |            |
| ...          |            |
| local7       |            |
| security     |            |

```bash
$ for i in {1..50};do logger $i --id=$$; done
% sudo tail /var/log/syslog -f
Dec  1 18:14:34 wbl5 adrian[12802]: 1
Dec  1 18:14:34 wbl5 adrian[12802]: 2
Dec  1 18:14:34 wbl5 adrian[12802]: 3
Dec  1 18:14:34 wbl5 adrian[12802]: 4
Dec  1 18:14:34 wbl5 adrian[12802]: 5
```
