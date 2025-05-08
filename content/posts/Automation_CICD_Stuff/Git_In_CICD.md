+++
title = 'Docker and Podman Notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['git', 'CI/CD', 'automation CI/CD stuff']
+++
# Git in CICD

## Fix git permission problems on shared repo

```bash
git config --global --add safe.directory /home/path/to/git
```

>These config entries specify Git-tracked directories that are considered safe even if they are owned by someone other than the current user. By default, Git will refuse to even parse a Git config of a repository owned by someone else. cf. <https://git-scm.com/docs/git-config#Documentation/git-config.txt-safedirectory>

## Fix ssh in CI/CD

<https://git-scm.com/docs/git-config#Documentation/git-config.txt---unset-all>

<https://git-scm.com/docs/git-config#Documentation/git-config.txt---get-regexp>

```powershell
git config --local --name-only --get-regexp core\.sshCommand
git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
```

## Sync git submodules

`git submodule sync --recursive`

<https://git-scm.com/docs/git-submodule#Documentation/git-submodule.txt-sync--recursive--ltpathgt82308203>
