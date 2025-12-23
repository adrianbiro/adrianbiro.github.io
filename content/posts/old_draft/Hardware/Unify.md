+++
title = 'Unify'
date = 2023-01-15T09:00:00-07:00
draft = true
tags = ['hardware', 'wifi', 'unify']
+++
# Unify

## Join to hosted controller

```bash
ssh ubnt@$device
set-inform http://$controller_address:8080/inform
```
