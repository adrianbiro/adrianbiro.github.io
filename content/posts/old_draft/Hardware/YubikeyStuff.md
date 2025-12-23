+++
title = 'Yubikey Stuff'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['hardware', 'security', 'youbikey']
+++
# Yubikey Stuff

[ykman piv](https://docs.yubico.com/software/yubikey/tools/ykman/PIV_Commands.html)
Add key to slot 9c
```sh
$ ykman piv certificates import 9c /root/ca/intermediate_ca.crt
$ ykman piv keys import 9c /root/ca/intermediate_ca_key
```

Change pin
```sh
$ ykman piv access change-pin --pin 123456 --new-pin 654321
```
