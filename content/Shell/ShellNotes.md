# Shell notes

## `$PATH`, `env` for cron job

[cron limited PATH](https://klarasystems.com/articles/rc8-freebsd-services-and-automation/)

```sh
env -i SHELL=/bin/sh PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin
HOME=/home/dbbkp NAME=dbbkp /home/dbbkp/bin/dbbkp.sh
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

## Detect import in Bash script

Like `__name__ == "__main__"` in python.

```bash
#!/bin/bash
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo -e "${BASH_SOURCE[0]} == ${0}"

fi
```

## Detect sudo

```bash
function _sudo() {
    if ((0 == "$(id --user)")); then
        "$@"
    else
        sudo "$@"
    fi
}
```

## Map

```bash
$ n=1; map[((n++))]='asd';map[((n++))]='qwe';map[((n++))]='987'; echo "${map[@]}"
asd qwe 987
$ n=1; map[((n++))]='asd';map[((n++))]='qwe';map[((n++))]='987'; echo "${map[@]:2:3}"
qwe 987
$ n=1; map[a]='asd';map[b]='qwe';map[c]='987'; echo "${map[b]}"
987
$ for i in "${!map[@]}"; do echo "key: ${i} value: ${map[$i]}"; done
key: 1 value: asd
key: 2 value: qwe
key: 3 value: 987
```
