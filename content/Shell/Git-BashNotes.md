# Git-Bash Notes

Git-bash notes on Windows. 


## Fix python path
```sh
cat /usr/bin/python
#!/bin/bash
"$ProgramW6432/Python3109/python" "${@}"
```
## `.gitconfig`
```cofig
[user]
	email = <email>
	name = Adrian Biro
[core]
	pager = less -R
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
[init]
    defaultBranch = main
[core]
	sshCommand = C:/Windows/System32/OpenSSH/ssh.exe
	compression = -1
	packedGitLimit = 512m
	packedGitWindowSize = 512m
[pack]
	deltaCacheSize = 2047m
	packSizeLimit = 2047m
	windowMemory = 2047m
[http]
	proxy = http://<user>:<passwd>@wpadweb.<DNS>/wpad.pac:3128 #8080 old
```