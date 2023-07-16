# Proxmox Tips

Remove Proxmox Subscription Notice. It is open source, yes, but if you use it, you shall pay for it. In case you just learning the platform, here how you do it. 
```sh
sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```
Remove enterprise repo to fix update error.
```sh
sed -i 's/^/#/' /etc/apt/sources.list.d/pve-enterprise.list
```