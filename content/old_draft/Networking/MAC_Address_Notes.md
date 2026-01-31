+++
title = 'MAC Adress Notes'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['networking']
+++
# MAC Adress Notes

Get random mac address

```bash
$ od -An -N6 -tx1 /dev/urandom | sed -e 's/^  *//' -e 's/  */:/g' -e 's/:$//' -e 's/^\(.\)[13579bdf]/\10/'
20:8f:f8:2a:ae:9a
$ hexdump -n 7 -ve '1/1 "%.2x "' /dev/urandom | sed -e 's/^  *//' -e 's/  */:/g' -e 's/:$//' -e 's/^\(.\)[13579bdf]/\10/'
60:06:74:bd:44:5d:b6
```

[MAC address wiki](https://en.wikipedia.org/wiki/MAC_address)
