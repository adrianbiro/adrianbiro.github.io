# Battery Info

```sh
$ cat /sys/class/power_supply/BAT0/capacity
97
$ upower --dump
```

```powershell
PS C:> $report = "$ENV:HOMEPATH\Downloads\b_report.html"
PS C:> powercfg /batteryreport /output $report
PS C:> ((Select-String -Path $report -Pattern '"percent">.*%').Matches.Value -replace '.*>','' -replace '%','' -replace '\s','' | Measure-Object -Average).Average
48.5
PS C:> Invoke-Item $report
```