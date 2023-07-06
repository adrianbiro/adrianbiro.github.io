# [adrianbiro.github.io](https://adrianbiro.github.io/)

This page is intended to rescue me in my ongoing struggle to share knowledge in a reusable way, so I will try move it here from emails, gists, confluence, Slack, and Teams messages that no-one can find after 2 days.

Get 90. vibe website.
```powershell
.\Get-html.ps1
```
Clean html.
```powershell
Remove-Item -LiteralPath (Get-ChildItem -Recurse -Filter '*.html').FullName
```
