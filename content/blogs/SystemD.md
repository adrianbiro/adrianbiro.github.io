# SystemD Notes


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