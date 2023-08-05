# Performance Monitoring

## Usefull commands
```sh
$ dmesg --human --follow --ctime 
```
```sh
iostat -xmdzh 1 # -p sda
# lsblk -l | awk '!(/loop/||/NAME/){print $1}'
```
```
CPU statistics and input/output statistics for devices and partitions
-x     Display extended statistics.
-m     Display statistics in megabytes per second.
-d     Display the device utilization report.
-z     Omit output for any devices for which there was no activity during the sample period.
-h     --human
```
#### Meminfo to MB
```sh
awk '{printf("%-20s %.2f MB\n", $1, ($2/1024))}' /proc/meminfo | sed 's/\.00//'
```
#### Processors related statistics
```sh
mpstat -P ALL 1
```
#### Statistics for threads associated with selected tasks
```sh
pidstat -t 1
```
```
Report statistics for Linux tasks.
-t     Also display statistics for threads associated with selected tasks.
Report I/O statistics (kernels 2.6.20 and later only)
pidstat -d 1
```
```sh
pmap -x # pgrep <prog>
```
```
report memory map of a process
-x, --extended
less -S /proc/stat
```
#### ps
```sh
ps -ef f
ps -eo user,sz,rss,minflt,majflt,pcpu,args
```
cpu
```sh
ps -eo pcpu,pid,args | sort -k 1,1 -r 
```
rss
```sh
ps -eo user,rss,pid,args | sort -r -n -k 2,2
```
threads
```
ps -eo nlwp,pid,args | sort -nr -k 1,1
```
```
Report a snapshot of the current processes.
-e     Select all processes.
-f     Do full-format listing.  This option can be combined with many other UNIX-style options to add additional columns.  It also causes
              the command arguments to be printed.  When used with -L, the NLWP (number of threads) and LWP (thread ID) columns will be added.
              See the c option, the format keyword args, and the format keyword comm.
f      ASCII art process hierarchy (forest). --forest
-o format
NLWP      number of lwps (threads) in the process.  (alias thcount).

sort 
-k, --key=POS1[,POS2] start a key at POS1 (origin 1), end it at POS2 (default end of line)
-n, --numeric-sort
-r, --reverse

RSS
https://www.baeldung.com/linux/resident-set-vs-virtual-memory-size
This is a measure of how much memory a process is consuming in our physical RAM, to load all of its pages after its execution.
This includes memory allocated from shared libraries, given they are still present in memory. Also, it includes all heap and stack memory.
RSS is not an accurate measure of the total memory processes are consuming, because it does not include memory consumed by libraries 
that were swapped out. On the other hand, the same shared libraries may be duplicated and counted in different processes. 
However, RSS is a reliable estimate.
```
#### sar
```sh
sar -n DEV 1
```
```
Collect, report, or save system activity information.
-n { keyword[,...] | ALL }
    Report network statistics.
    With  the DEV keyword, statistics from the network devices are reported.
```
#### Sort slabinfo to see what objects taking the most space [slabinfo(5)](https://man7.org/linux/man-pages/man5/slabinfo.5.html) [linux OOM](https://linux-mm.org/OOM)
```sh
awk '{printf "%-30s %5d MB\n", $1 ,$3*$4/(1024*1024)}' < /proc/slabinfo | sort -nr -k2
```
#### smem
```sh
smem -s swap -r | awk 'NR==1{print; next};int($4) > 0'
```
```
Report memory usage with shared memory divided proportionally.
-s SORT, --sort=SORT
-r, --reverse
AWK print header and non-zero swap usage
```
#### Top one program show individual threads
```sh
top -b -d 1 -p "$(pgrep "${1}" | head -1)" -H
``` 
```
-b  Batch-mode operation
-d  Delay-time interval between screen updates
-p  Monitor-PIDs
-H  Threads-mode operation
    Instructs  top  to  display  individual  threads. Without this command-line option a summation of all threads in each
    process is shown.  Later this can be changed with the `H' interactive command.
```
#### vmstat
```sh
vmstat  -Sm 1
```
```
Report virtual memory statistics
-S, --unit character
    Switches outputs between 1000 (k), 1024 (K), 1000000 (m), or 1048576 (M) bytes.  
    Note this does not change the block (bi/bo) fields, which are always measured in blocks.
-m, --slabs
    Displays slabinfo.
```
#### Core freq [cpuinfo flags](https://www.baeldung.com/linux/proc-cpuinfo-flags)
```sh
awk '
BEGIN {	FS = ":" }

$1 ~ /^processor[[:space:]]+$/ { Processor = $2 }

$1 ~ /^cpu MHz[[:space:]]+$/ { Cores[Processor] = $2 }

END { for (Processor in Cores) { printf("CORE_%d: %d\n", Processor + 1, Cores[Processor]) }
}' /proc/cpuinfo

```
#### Cpu temperature
```sh

find /sys/class/thermal/thermal_zone*/ -maxdepth 0 -print0 | while IFS= read -r -d '' dir; do
    echo "$(cat "${dir}"/type): $(sed 's/\(.\)..$/.\1°C/' "${dir}/temp")"
done
```
temp stores 54000 millidegree Celsius, that means 54°C
https://www.kernel.org/doc/Documentation/thermal/x86_pkg_temperature_thermal
https://www.kernel.org/doc/Documentation/thermal/sysfs-api.txt


----
----
## Linux Performance Monitoring Primer

[Linux Performance Monitoring Tools - YouTube](https://www.youtube.com/watch?v=2OsTSD5z1SU)

[Linux Performance Tools, Brendan Gregg, part 1 of 2 - YouTube](https://www.youtube.com/watch?v=FJW8nGV4jxY&list=WL&index=8&t=1497s)

[Linux Performance Tools, Brendan Gregg, part 2 of 2 - YouTube](https://www.youtube.com/watch?v=zrr2nUln9Kk&list=WL&index=7)

[Linux Performance](https://brendangregg.com/linuxperf.html)

[Linux Performance Analysis in 60,000 Milliseconds Netflix TechBlog](https://netflixtechblog.com/linux-performance-analysis-in-60-000-milliseconds-accc10403c55)

## Memory

[Experiments and fun with the Linux disk cache](https://www.linuxatemyram.com/play.html)

[Drop_Caches - linux-mm.org Wiki](https://linux-mm.org/Drop_Caches)

[Help! Linux ate my RAM!](https://www.linuxatemyram.com/)

[Low On Memory](https://linux-mm.org/Low_On_Memory)

[Memory pressure](https://linux-mm.org/Memory_pressure)

[Memory Hierarchy](https://linux-mm.org/MemoryHierarchy)

[OOM](https://linux-mm.org/OOM)

[Difference Between Resident Set Size and Virtual Memory Size](https://www.baeldung.com/linux/resident-set-vs-virtual-memory-size)

[Prstat on Linux with Top](http://javaeesupportpatterns.blogspot.com/2012/02/prstat-linux-how-to-pinpoint-high-cpu.html)
## Tools 

### Flame Graphs

[Pyroscope](https://pyroscope.io/downloads/)

[Pyroscope EBPF](https://pyroscope.io/docs/ebpf/)

[Java Mixed-Mode Flame Graphs - YouTube](https://www.youtube.com/watch?v=BHA65BqlqSk)

### DTrace

[Open Trace Toolkit](https://github.com/opendtrace/toolkit)

[Dtrace Illumos](https://illumos.org/books/dtrace/preface.html#preface)

### SystemTap

[SystemTap Beginners Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/systemtap_beginners_guide/index)

[Getting Started With SystemTap on Oracle Linux](https://blogs.oracle.com/linux/post/getting-started-with-systemtap-on-oracle-linux)

[SystemTap Wiki](https://sourceware.org/systemtap/wiki/)

[SystemTap Beginners Guide](https://sourceware.org/systemtap/SystemTap_Beginners_Guide/)

### Strace

[Strace](https://opensource.com/article/19/10/strace)

### Solaris

[prstat(8)](https://docs.oracle.com/cd/E88353_01/html/E72487/prstat-8.html)

[prstat(8) Illumos](https://illumos.org/man/8/prstat)

[Understanding the Differences Between prstat and vmstat Output in the Solaris OS](https://www.oracle.com/technical-resources/articles/prstat-vs-vmstat-jsp.html#2)

[Utilities to Measure the Performance of an Existing System](https://www.juniper.net/documentation/en_US/sbr-carrier7.6.0/information-products/topic-collections/sw-sbrc-perf-tuning/index.html?jd0e2093.html#psrinfo)

## EBPF

[What is eBPF, anyway, and why should Kubernetes admins care?](https://www.groundcover.com/blog/what-is-ebpf)

[bcc/tutorial.md at master · iovisor/bcc · GitHub](https://github.com/iovisor/bcc/blob/master/docs/tutorial.md)

[BPF CO-RE (Compile Once – Run Everywhere)](https://nakryiko.com/posts/bpf-portability-and-co-re/)

[Learn eBPF Tracing: Tutorial and Examples](https://www.brendangregg.com/blog/2019-01-01/learn-ebpf-tracing.html)

[EBPF go](https://github.com/cilium/ebpf)

[BPF - the forgotten bytecode cloudflare](https://blog.cloudflare.com/bpf-the-forgotten-bytecode/)

[bpf-helpers(7)](https://www.man7.org/linux/man-pages/man7/bpf-helpers.7.html)