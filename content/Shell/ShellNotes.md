# Shell notes

## `$PATH`, `env` for cron job
[cron limited PATH](https://klarasystems.com/articles/rc8-freebsd-services-and-automation/)
```sh
$ env -i SHELL=/bin/sh PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin
$ HOME=/home/dbbkp NAME=dbbkp /home/dbbkp/bin/dbbkp.sh
```

## Get script location
```sh
"$(readlink -f $(dirname "$0"))"
"$(cd $(dirname "$0") && pwd)"
```
## Launch Signal with specific locale 
```bash
bash -c "LANGUAGE=sk_SK LANG=sk_SK.UTF-8 /opt/Signal/signal-desktop --no-sandbox %U"
```

