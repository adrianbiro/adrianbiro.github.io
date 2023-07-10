# SystemD Notes

## Usage
`systemctl list-units --state=help` 

List the queued jobs `systemctl list-jobs`

`systemctl list-units --type service`

List services enabled on boot `systemctl list-unit-files --state=enabled`

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

## Links
[managing system services with systemctl](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-system-services-with-systemctl_configuring-basic-system-settings)

[optimizing systemd](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/optimizing-systemd-to-shorten-the-boot-time_configuring-basic-system-settings#ref_a-guide-to-selecting-services-that-can-be-safely-disabled_optimizing-systemd-to-shorten-the-boot-time)