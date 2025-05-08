# System Security Stuff

## [TPM](https://en.wikipedia.org/wiki/Trusted_Platform_Module)
```powershell
PS> Get-WmiObject -Class 'Win32_TPM' -Namespace 'root/cimv2/Security/MicrosoftTPM'
```
```sh
$ cat /sys/class/tpm/tpm0/device/caps
```
[Detect CVE 2017 15361 TPM](https://github.com/nsacyber/Detect-CVE-2017-15361-TPM/tree/master)

## UEFI

[CSI UEFI lockdown](https://www.nsa.gov/portals/75/documents/what-we-do/cybersecurity/professional-resources/csi-uefi-lockdown.pdf)

[Microsoft UEFI benefits](https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-uefi#boot-and-miminum-security-requirements)

## Links

[NSA Hardware and Firmware Security Guidance](https://github.com/nsacyber/Hardware-and-Firmware-Security-Guidance)