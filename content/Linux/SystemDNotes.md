# SystemD Notes

## Service managemet

`systemctl list-units --state=help`

List the queued jobs `systemctl list-jobs`

`systemctl list-units --type service --state=active`

Get failed `systemctl list-units --failed`

List services enabled on boot `systemctl list-unit-files --state=enabled`

Prevent service from starting `systemctl mask <name>`

## Monitor config file for change with Systemd.path

```sh
cat > /etc/systemd/system/<name>.service << EOF
[Unit]
Description=<Name>
After=network-online.target

[Service]
Environment="PORT=9879"
Environment="HOST=::"
ExecStart=/usr/bin/<pwsh> /opt/<name> -start
Restart=always

[Install]
WantedBy=multi-user.target
EOF
```

Rebuild service [oneshot](https://www.redhat.com/sysadmin/systemd-oneshot-service)

```sh
cat > /etc/systemd/system/<name>-rebuild.service << EOF
[Unit]
Description=Rebuild on Config Changes

[Service]
Type=oneshot
ExecStart=/usr/bin/<pwsh> --cwd=/opt/<name> -build
EOF
```

Create systemd path to call service on config file change [systemd.path](https://www.freedesktop.org/software/systemd/man/systemd.path.html)

```sh
cat > /etc/systemd/system/<name>-rebuild.path << EOF
[Unit]
Description=Monitor Config for Changes

[Path]
PathChanged=/opt/<name>/conf.xml

[Install]
WantedBy=multi-user.target
EOF
```

```sh
systemctl daemon-reload
systemctl enable --now <name>
systemctl enable --now <name>-rebuild.path
```

## Minimal service config

[exec](https://www.freedesktop.org/software/systemd/man/systemd.exec.html) [service](https://www.freedesktop.org/software/systemd/man/systemd.service.html) [unit](https://www.freedesktop.org/software/systemd/man/systemd.unit.html)

```
[Unit]
Description=Monitor
After=network-online.target

[Service]
ExecStart=/usr/bin/perl /opt/monitor/main.pl -n <n>
Restart=always

[Install]
WantedBy=multi-user.target
```

`$ chmod 664 /etc/systemd/system/monitor.service`

## Boot target

```sh
systemctl get-default
systemctl set-default graphical.target
systemctl isolate multi-user.target
```

## Rescue mode

```sh
systemctl rescue
```

## [systemd-analyze](https://www.freedesktop.org/software/systemd/man/systemd-analyze.html)

reports system boot time broken down into how long the kernel took to load before entering userspace and how long the userspace components took to load.

```sh
systemd-analyze
```

See a list displaying service start times

```sh
systemd-analyze blame
```

[optimizing systemd](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/optimizing-systemd-to-shorten-the-boot-time_configuring-basic-system-settings#ref_a-guide-to-selecting-services-that-can-be-safely-disabled_optimizing-systemd-to-shorten-the-boot-time)

## Hardening

`systemd-analyze security <service_name>`

[Systemd exec (sandboxing)](https://www.freedesktop.org/software/systemd/man/systemd.exec.html)

[Systemd resoruce control](https://www.freedesktop.org/software/systemd/man/systemd.resource-control.html#)

```ini
...
[Service]
ExecStart=/usr/sbin/<nprogame> -n
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure
RestartSec=2
# Hardening
CapabilityBoundingSet=
LockPersonality=yes
MemoryDenyWriteExecute=yes
NoNewPrivileges=yes
PrivateDevices=yes
PrivateTmp=yes
ProtectClock=yes
ProtectControlGroups=yes
ProtectHome=yes
ProtectKernelLogs=yes
ProtectKernelModules=yes
ProtectKernelTunables=yes
ProtectSystem=strict
ReadWritePaths=/var/lib
RestrictNamespaces=yes
RestrictRealtime=yes
RestrictSUIDSGID=yes
StateDirectory=<progname>
...
```

## Files

`/etc/systemd/system` `/usr/lib/systemd/system`

## Links

[managing system services with systemctl](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-system-services-with-systemctl_configuring-basic-system-settings)
