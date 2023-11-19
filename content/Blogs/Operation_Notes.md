# Operation Notes

## 99.999%

[uptime.js](https://uptime.is/)

[Five Nines Availability SUSE](https://www.suse.com/suse-defines/definition/five-nines-availability-99-999-uptime/)

[The Perfect Six Sigma Team is 99.997% Defect Free](https://6sigma.com/the-perfect-six-sigma-team-is-99-997-defect-free/)

Uptime when I started *The Service and the Time is NDA info*

```bash
$ curl -s 'https://get.uptime.is/api?sla=73'
{
  "SLA": 73.0, 
  "dailyDownSecs": 23328.0, 
  "dailyDown": "6h 28m 48s", 
  "weeklyDownSecs": 163296.0, 
  "weeklyDown": "1d 21h 21m 36s", 
  "monthlyDownSecs": 704199.42, 
  "monthlyDown": "8d 3h 36m 39s", 
  "quarterlyDownSecs": 2112598.26, 
  "quarterlyDown": "24d 10h 49m 58s", 
  "yearlyDownSecs": 8450393.04, 
  "yearlyDown": "97d 19h 19m 53s", 
  "uptimeURL": "https://uptime.is/73",
  "timestamp": "<NDA info>", 
  "runtime": "0.000s"
}
```

Uptime after I fixed it. There was still another legacy third-party service on which our platform was dependent that just couldn't do an upgrade and be operational at the same time.

```bash
$ curl -s 'https://get.uptime.is/api?sla=99.93'
{
  "SLA": 99.93, 
  "dailyDownSecs": 60.47999999999411, 
  "dailyDown": "1m 0.48s", 
  "weeklyDownSecs": 423.35999999995875, 
  "weeklyDown": "7m 3.4s", 
  "monthlyDownSecs": 1825.7021999998221, 
  "monthlyDown": "30m 26s", 
  "quarterlyDownSecs": 5477.106599999466, 
  "quarterlyDown": "1h 31m 17s", 
  "yearlyDownSecs": 21908.426399997865, 
  "yearlyDown": "6h 5m 8.4s", 
  "uptimeURL": "https://uptime.is/99.93", 
  "timestamp": "<NDA info>", 
  "runtime": "0.000s"
}
```
