# Proxmox Tips

Remove Proxmox Subscription Notice. It is open source, yes, but if you use it, you shall pay for it. In case you just learning the platform, here how you do it. 
```sh
$ sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
```
Remove enterprise repo to fix update error.
```sh
$ sed -i 's/^/#/' /etc/apt/sources.list.d/pve-enterprise.list
```

## Proxmox to S3

1. Create a non-admin user in AWS Console
1. In Credentials and create a new Access Key
1. Go to the S3 service and create a new bucket 
1. In the bucket's Management tab create a new Lifecycle rule, with Instant Retrieval after 7 days
1. In proxomox create a variable with the Access Key:
```sh
$ vi /etc/passwd-s3fs
ACCESS_KEY_ID:SECRET_ACCESS_KEY
$ chmod 640 /etc/passwd-s3fs
$ sudo apt install -y s3fs
$ mkdir /mnt/s3-bucket
$ vi /etc/fuse.conf # Enable user_allow_other 
$ vi /etc/fstab
s3fs#<s3_bucket_name> /mnt/s3-bucket/ fuse _netdev,allow_other,url=https://s3.amazonaws.com 0 0
$ reboot
```
1. In the Datacenter Storage section add a new storage of type Directory and insert your mounted dir `/mnt/s3-bucket``, set a ID like AWS-s3, and select all the content types 

## Monitoring

[External Metric Server](https://pve.proxmox.com/wiki/External_Metric_Server)