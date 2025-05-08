+++
title = 'Just Use Dig'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['networking', 'dns', 'dig']
+++
# Just Use Dig

Here is what you should now to use `dig` tool.

Search for particular record, default is A.

```bash
dig CNAME cloudflare.com
```

Make reverse lookup.

```bash
$ dig -x 104.16.132.229 
...
$ dig ptr 229.132.16.104.in.adde.arpa
...
```

Use specific DNS server and show shorter output.

```bash
dig @9.9.9.9 +short cloudflare.com
```

Traces how the domain it’s resolved, with TCP when querying name servers. The default behavior is to use UDP.

```bash
dig +trace +tcp cloudflare.com
```
