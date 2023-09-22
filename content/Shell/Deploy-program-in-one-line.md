# Deploy the program in one line

_Use case:_  From time to time  I need to split large CSV files from a pod, This line will deploy a utility script to do the job.

```bash
eval "$(base64 -dw0 <<< 'IyEvYmluL3NoCnByb2c9IiR7SE9NRX0vYmluLyxzaGlmdGxpbmVzLnNoIgpta2RpciAtcCAiJHtwcm9nJS8qfSIKY2F0IDw8J0VORF9QUk9HJyA+ICIke3Byb2d9IgojIS9iaW4vYmFzaAppZiBbICR7I30gLWVxIDAgXTsgdGhlbiBwcmludGYgIlVzYWdlOlxuXHQlcyA8aW5wdXRfZmlsZT4gPG91dHB1dF9maWxlPiA8bnVtYmVyX2xpbmVzX3RvX3NoaWZ0PlxuIiAiJHswIyMqL30iOyBleGl0IDE7IGZpCmluZmlsZT0kezE6P30Kb3V0ZmlsZT0kezI6P30KbnVtbGluZXM9JHszOj99CgojIGFkZCBoZWFkZXIKaGVhZCAtbiAxICIke2luZmlsZX0iID4+IiR7b3V0ZmlsZX0iCiMgc2tpcCBoZWFkZXIgc2hpZnQgZmlyc3QgTiBsaW5lcyAyLW4KIyBzaGVsbGNoZWNrIGRpc2FibGU9U0MyMDg2CnNlZCAtaSAtZSAyLCR7bnVtbGluZXN9JCd7dy9kZXYvc3Rkb3V0XG47ZH0nICIke2luZmlsZX0iID4+IiR7b3V0ZmlsZX0iICMjIHRvZG8gaW4gcG9zaXggc2hlbGwgYmFzaCB3b3JrcyBCYXNoaXNtICQnLi4nCgpFTkRfUFJPRwoKY2htb2QgK3ggIiR7cHJvZ30iCiMgc2hlbGxjaGVjayBkaXNhYmxlPTIwMTYKZWNobyAnUEFUSD0iJEhPTUUvYmluOiRQQVRIIicKCg==' | bash)"
```

Or with `xdd`, idea from [Infecting SSH Public Keys with backdoors](https://blog.thc.org/infecting-ssh-public-keys-with-backdoors)

```bash
$ string=$"(echo 'ls -l | wc -l' | xxd -p)"
$ eval "$(echo $string | xxd -r -p)"
...
```

## Base64 notes

In the `Busybox` version of coreutils, there are no long options for `base64`

```bash
$ echo asdasdasd | base64 --wrap=0
base64: unrecognized option: wrap=0
BusyBox v1.35.0 (2022-11-19 10:13:10 UTC) multi-call binary.

Usage: base64 [-d] [-w COL] [FILE]

Base64 encode or decode FILE to standard output

 -d Decode data
 -w COL Wrap lines at COL (default 76, 0 disables)
```

## Script notes

It depends on some bashism `$'..'` so in a container Bash needs to be installed. 

To see what it do, make test file with `perl -E 'say "header"; foreach (1..100){say $_}'`, and run it.

Idea from [Bash pop lines](https://stackoverflow.com/questions/13804967/bash-pop-lines-in-a-file)

```jsx
#!/bin/sh
prog="${HOME}/bin/,shiftlines.sh"
mkdir -p "${prog%/*}"
cat <<'END_PROG' > "${prog}"
#!/bin/bash
if [ ${#} -eq 0 ]; then printf "Usage:\n\t%s <input_file> <output_file> <number_lines_to_shift>\n" "${0##*/}"; exit 1; fi
infile=${1:?}
outfile=${2:?}
numlines=${3:?}

# add header
head -n 1 "${infile}" >>"${outfile}"
# skip header shift first N lines 2-n
# shellcheck disable=SC2086
sed -i -e 2,${numlines}$'{w/dev/stdout\n;d}' "${infile}" >>"${outfile}" ## Bashism $'..'

END_PROG

chmod +x "${prog}"
# shellcheck disable=2016
echo 'PATH="$HOME/bin:$PATH"'
```
