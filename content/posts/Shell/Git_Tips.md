+++
title = 'Git Tips'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['shell', 'bash', 'git']
+++
# Git Tips

Set different urls for `push` and `fetch`

```bash
% ~/src/m_bin%(main) git remote set-url origin https://github.com/adrianbiro/m_bin.git
% ~/src/m_bin%(main) git remote set-url --push origin git@github.com:adrianbiro/m_bin.git
% ~/src/m_bin%(main) git remote -v
origin  https://github.com/adrianbiro/m_bin.git (fetch)
origin  git@github.com:adrianbiro/m_bin.git (push)
```

Git config on Windows corporate machine with the WPAD Proxy and bandwidth restrictions

```ini
[user]
    email = Adrian.Biro@<domain.org>
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
    proxy = http://<user>:<passwd>@wpadweb.d<omain.org>/wpad.pac:3128 #8080
```

## Git-Bash on windows

Fix python path

```sh
cat /usr/bin/python
#!/bin/bash
"$ProgramW6432/Python3109/python" "${@}"
```
