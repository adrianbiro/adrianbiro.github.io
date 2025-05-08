# Limiting Ptrace and Gdb on Production Systems

Since ptrace is not commonly used by non-developers and non-admins, system builders should be allowed the option to disable this debugging system.

According [NSA recomendation](https://www.nsa.gov/portals/75/documents/what-we-do/cybersecurity/professional-resources/csi-limiting-ptrace-on-production-linux-systems.pdf?ver=2019-05-16-151825-133) and [Unified Compliance recommended settings for DoD on rhel8 systems, that place it in medium category](https://www.stigviewer.com/stig/red_hat_enterprise_linux_8/2021-12-03/)

> Production systems rarely need to use debugging utilities. For this reason, it is often safe to remove the ability to perform
> ptrace-related functions, at least in normal operational mode. The YAMA Linux Security Module, included in most Linux
> distributions, can be used to remove the ability for any process to ptrace another. To configure systems to automatically
> do this on boot, create a service file in `/etc/systemd/system` with the following contents:

```sh
[Unit]
Description=Removes, system-wide, the ability to ptrace
ConditionKernelCommandLine=!maintenance
[Service]
Type=forking
Execstart=/bin/bash –c “sysctl -w kernel.yama.ptrace_scope=3”
Execstop=
[Install]
WantedBy=default.target
```
Check owner and group permissions, then run `systemctl daemon-reload` and on the next boot, tracing will be completely disabled.

To re-enable debugging utilities, initiate a `reboot`. During `boot`. in grub menu select kernel and press `e` to edit the kernel arguments to include the value `maintenance`. Then `Ctrl + X` system should then reboot. [Configuring kernel parameters at runtime](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_monitoring_and_updating_the_kernel/configuring-kernel-parameters-at-runtime_managing-monitoring-and-updating-the-kernel)

Once troubleshooting is finished, disable it by running `sysctl -w kernel.yama.ptrace_scope=3`

### Links
[Protect against ptrace of processes: kernel.yama.ptrace_scope](https://linux-audit.com/protect-ptrace-processes-kernel-yama-ptrace_scope/)

[Yama security kernel.org](https://www.kernel.org/doc/Documentation/security/Yama.txt)

[Yama Admin Guide kernel.org](https://www.kernel.org/doc/html/v5.4/admin-guide/LSM/Yama.html)

[RHEL 8 must restrict usage of ptrace to descendant processes Unified Compliance Framework](https://www.stigviewer.com/stig/red_hat_enterprise_linux_8/2021-12-03/finding/V-230546)