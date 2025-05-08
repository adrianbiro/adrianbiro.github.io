+++
title = 'Pandoc Tips'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['pandoc']
+++
# Pandoc Tips

## Generate **EPUB3** from **markdown** file

```bash
pandoc --from markdown --to epub3 go_performance.md \
    --output go-perfbook.epub \
    --table-of-contents \
    --epub-cover-image=Golang-3.jpg \
    --metadata-file=metadata.yaml
```

`metadata.yaml` or with CLI flags `--metadata title='title of book' --metadata author='author name'`

```yaml
---
title: 'Go-perfbook'
creator:
- 'Damian Gryski'
language: 'en'
keywords:
- 'go'
- 'golang'
- 'performance'
subject: 'golang'
publisher: 'Your Publisher Name Here'
date: '2023-04-09'
identifier: 'Your Unique Identifier Here'
abstract: |
  This document outlines best practices for writing high-performance Go code. 
  The first sections cover writing optimized code in any language. 
  The later sections cover Go-specific techniques. 
  https://github.com/dgryski/go-perfbook
---
```
