# System Security Stuff

## TPM
```powershell
PS> Get-WmiObject -Class 'Win32_TPM' -Namespace 'root/cimv2/Security/MicrosoftTPM'
```
```sh
$ cat /sys/class/tpm/tpm0/device/caps
```