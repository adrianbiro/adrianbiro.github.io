+++
title = 'Cryptography And Randomness Notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['Cryptography']
+++
# Cryptography And Randomness Notes

## `/dev/random/ /dev/urandom`

The files in the directory `/proc/sys/kernel/random` provide an additional interface to the `/dev/random` device, cf. 
`man 4 random | less +/proc\ Interface`
```sh
$ base64 /proc/sys/kernel/random/uuid
ZTE2Y2U5ZWQtNDI3My00ZGYyLWI3YTYtZGY2OTdhZmU1MzJkCg==
$ sed 's/-//g' /proc/sys/kernel/random/uuid 
73c9c0c65f1c43eab2826d669b9c40b3
$ head -c 30 /dev/urandom | base64
kr7T5iC5X3TdxHxizD12NpPUB5wIxipIdfqAN6WY
```
[Myths about urandom](https://www.2uo.de/myths-about-urandom/) In Linux 4.8 the equivalency between `/dev/urandom` and `/dev/random` was given up. Now `/dev/urandom` output does not come from an entropy pool, but directly from a `CSPRNG`.

[When to use dev random over dev urandom in linux](https://crypto.stackexchange.com/questions/41595/when-to-use-dev-random-over-dev-urandom-in-linux)

[Linux /dev/random safely generate random numbers](https://sockpuppet.org/blog/2014/02/25/safely-generate-random-numbers/)

[Windows CryptGenRandom function](https://learn.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-cryptgenrandom?redirectedfrom=MSDN)

## Links

### Cryptography 
[Cryptographic Best Practices](https://gist.github.com/adrianbiro/a58ba492cb9eeb96c7902dfac6b34fa7)

[NSA Cybersecurity Information Sheet The Commercial National Security Algorithm Suite 2.0 and Quantum Computing FAQ](https://media.defense.gov/2022/Sep/07/2003071836/-1/-1/0/CSI_CNSA_2.0_FAQ_.PDF)

[Size requirement for security](https://www.keylength.com/en/compare/)

[The Physic of Brute Force](https://pthree.org/2016/06/19/the-physics-of-brute-force/)

[Cryptographic Right Answers](https://latacora.micro.blog/2018/04/03/cryptographic-right-answers.html)

[Security and Cryptography MIT](https://missing.csail.mit.edu/2020/security/)


### Password
[PIN analysis](http://www.datagenetics.com/blog/september32012/)