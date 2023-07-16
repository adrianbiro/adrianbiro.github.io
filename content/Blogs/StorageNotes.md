# Storage notes

## [SCSI disk format](https://linux.die.net/man/8/sg_format)

`sg_format --format /dev/sdX` It take time!
It is useful when failing to read, but not write. Rationale: the device was in the disk array controller before.

Check `dmesg`
```sh
$ dmesg
blk_update_request: protection error
```
 

