# Find And Xargs Tips

Find broken links `find /usr/bin/ -type l -xtype l`

Select a file based on multiple conditions

```bash
find /srv/app/sandbox-storage/ -maxdepth 3 -regextype posix-extended -regex ".*(docx|txt|tsv|csv|pdf|json|zip)" -mtime +30 -type f -delete
```

## To select a file based on size and another condition

Wrong way  `ls -l | cut -d' ' -f4 | ...` better one  `find size 31c` cron job example.

```bash
find /app/csops/import/ \( \( -name 'SFDW.HPDWHP.SMAPP1.DA*ERRS' -a -size 31c \) -o \( -name 'ASSC.ADSPP1.SMAPP1.FZ*ERRS' -a -size 59c \) -o \( -name 'CTBR.YB0A00.SMAPP1.SK*ERRS' -a -size 268c \) -o \( -name 'CLSC.CLMPP1.SMAPP1.VR*ERRS' -a -size 109c \) -o \( -name 'CLUN.CLMPP1.SMAPP1.UN*ERRS' -a -size 663c \) -o \( -name 'COLI.CSCOLL.SMAPP1.CI*ERRS' -a  -size 83c \) -o \( -name 'TMBR.CSCOLL.SMAPP1.AT*ERRS' -a -size 362c \) \) -print0 | xargs -n 1000 -0 mv -t /app/csops/archiv/
```

In this example there is a few things useful to know:

- conditionals escaped with a backslash to prevent opening subshell `\\( ... \\)`
- `-print0` print the full file name followed by a null character, instead of the newline. This allows file names that contain newlines or other types of white space to be correctly interpreted by programs that process the find output. This option is the same as in `perl -0 sort -z xargs -0 grep -Z cpio -0`
- `xargs -n` is for max arguments, to prevent launching separate processes for each input

## Process arguments in bit complex logic then `-exec` can handle

In case you need to perform backup of metadata from the `container` and there is no way due corporate permission you can access mounted volume but from `pod` , and you need put all file to one directory. This will  transform this structure `dir1/config.xml dir2/config.xml` to `bkp/dir1_config.xml bkp/dir2_config.xml`.

## Process arguments in a bit complex logic then `-exec` can handle

In case you need to perform a backup of metadata from the `container` and there is no way due to corporate permission you can access the mounted volume but from `pod`, you need to put all files in one directory. This will transform this structure `dir1/config.xml` `dir2/config.xml` to `bkp/dir1_config.xml bkp/dir2_config.xml`.

```bash
# Create backup
find . -maxdepth 2 -name 'config.xml' -print0 | while IFS= read -r -d '' dir; do name="$(sed 's/\.\///g; s/\//_/g' <<< ${dir})"; cp "${dir}" "bkp/${name}"; done
# Restore
find bkp/ -print0 | while IFS= read -r -d '' name; do dir="$(sed 's/_config.xml//; s/bkp\///' <<< ${name})"; mkdir -p "${dir}"; cp "${name}" "${dir}/config.xml" ; done
```

## This is useful when there is too much input

```bash
# ok
$ du -sh
12G     .
$ ls -l | wc -l
1631
$ grep -c ERROR *.log
# Works ...
$ du -sh
166G    .
$ ls -l | wc -l
798146
$ zgrep -c ERROR *.log.gz
/usr/bin/zgrep: Argument list too long
$ zgrep -c ERROR smart-*.log.gz
/usr/bin/zgrep: Argument list too long
# solution
$ find /srv/log/xp/openshift/appdata/smart-prod-applogs -newermt "$(date -d "2 day ago" +"%Y-%m-%d")" ! -newermt "$(date +"%Y-%m-%d")"  -name "smart-*" -exec zgrep -c ERROR {} \; | awk  '{sum+=int($0)}END{print sum}'
147421
# another huge one 
$ du -sh
5.8T    .
```

## Stop xargs iteration after error

```bash
echo -e '/boot\nqwe\npoi' | xargs -I{} bash -xc 'ls {} || exit 255'
```

> If any invocation of the command exits with a status of 255, xargs will stop  immediately  without reading any further input.  An error message is issued on stderr when this happens.
