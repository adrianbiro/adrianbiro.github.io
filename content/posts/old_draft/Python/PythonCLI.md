+++
title = 'Python CLI'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['python']
+++
# Python CLI

```sh
~% python3 -m base64 -h
option -h not recognized
usage: /usr/lib/python3.10/base64.py [-d|-e|-u|-t] [file|-]
        -d, -u: decode
        -e: encode (default)
        -t: encode and decode string 'Aladdin:open sesame'
```
```sh
~% python3 -m json.tool -h
usage: python -m json.tool [-h] [--sort-keys] [--no-ensure-ascii]
                           [--json-lines]
                           [--indent INDENT | --tab | --no-indent | --compact]
                           [infile] [outfile]
```

```sh
~% python3 -m http.server -h
usage: server.py [-h] [--cgi] [--bind ADDRESS] [--directory DIRECTORY] [port]
```

```sh
~% python3 -m gzip -h
usage: gzip.py [-h] [--fast | --best | -d] [file ...]
```