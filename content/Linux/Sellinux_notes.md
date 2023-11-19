# Sellinux notes

## Status

To get the status of selinux

```bash
getenforce
sestatus
cat /etc/selinux/config
```

To get the context of files/processes/ports/users

```bash
ls -Z
ps -Z
ss -Z
id -Z
```

Set the status to permissive `setenforce 0`

Get all booleans `getsebool -a`

Set a boolean permanently `setsebool foo_bar 1 -P`

Get all changed booleans `cat /var/lib/selinux/targeted/active/booleans.local`

## File context management

Set a context `chcon -t foo /path/to/bar`

Set all files to the right context in the directory `restorecon -vR /path/bar`

Create a rule with `semanage` for `/foo` and for the `httpd` `semanage fcontext -a -t httpd_sys_content_t "/foo(/.*)?"`
or `semanage -a -e /var/www/html /foo`

Run `restorecon` `restorecon -vR /foo`

## Modules

To create a module, you need to set selinux in permissive mode and test the application with all its features `setenforce 0`
then check the journalctl log `journalctl` and search for `sealert`, then run `sealert -l <uuid>`
and run the following commands from the output

```bash
grep foobar /var/log/audit/audit.log | audit2allow -M mypol
sudo semodule -i mypol.pp
```
