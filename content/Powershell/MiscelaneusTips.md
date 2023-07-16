# Miscelaneus Tips

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