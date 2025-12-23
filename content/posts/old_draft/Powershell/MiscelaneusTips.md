+++
title = 'Miscelaneus Powershell Tips'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['powershell']
+++
# Miscelaneus Powershell Tips

## Reflection in Poweshell Get-Member

```powershell
ConvertFrom-Json -InputObject (Invoke-WebRequest -Uri "www.postman-echo.com/get").Content | Get-Member             
                                                                                                                        
   TypeName: System.Management.Automation.PSCustomObject

Name        MemberType   Definition
----        ----------   ----------
Equals      Method       bool Equals(System.Object obj)
GetHashCode Method       int GetHashCode()
GetType     Method       type GetType()
ToString    Method       string ToString()
args        NoteProperty System.Management.Automation.PSCustomObject args=
headers     NoteProperty System.Management.Automation.PSCustomObject headers=@{x-forwarded-proto=http; x-forwarded-port=80; host=ww…
url         NoteProperty string url=http://www.postman-echo.com/get

```

Similar to the python [inspect](https://docs.python.org/3/library/inspect.html) module.

## Unblock module

```powershell
Get-ChildItem -Path '.' -Recurse -Include '*.ps1','*.psm1','*.psd1' | Unblock-File -Verbose
```

## Enable Debug or Verbose output

```powershell
PS /home/adrian> function foo {
 [CmdletBinding()]
  Param([parameter(ValueFromRemainingArguments=$true)][String[]] $args)       
 Write-Verbose 'VVVVVVV'
  Write-Debug 'DDDDDDD'  
  Write-Host "host"    
}
PS /home/adrian> foo -Debug -Verbose
VERBOSE: VVVVVVV
DEBUG: DDDDDDD
host
PS /home/adrian>
```
