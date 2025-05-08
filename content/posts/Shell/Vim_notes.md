+++
title = 'Vim notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['shell', 'bash']
+++
# Vim notes

Create session

```sh
:mksession ~/.vim/sessions/bum.vim
```

Rstore session

```sh
:source ~/.vim/sessions/bum.vim
vim -S ~/.vim/sessions/bum.vim
```

Create file and nested directories

```bash
function mkvim()
{ 
    mkdir -p "${1%/*}"; vim "${1}"; 
}
```

Delete all up `dgg`, delete all down `dG`
