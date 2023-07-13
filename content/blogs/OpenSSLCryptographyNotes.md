# OpenSSL, Cryptography notes

## [Certificate after DNS change](https://serverfault.com/questions/750902/how-to-use-lets-encrypt-dns-01-challenge-validation#812038)
`certbot -d mydomainename.com --manual --preferred-challenges dns certonly`

## Check certificate validity (days left)
```bash
#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

if [[ ${#} -eq 0 ]]; then
  echo -e "Usage:\v${0##*/} <example.com>\n"
  exit 1
fi
data=$(echo |
  openssl s_client -servername "${1}" -connect "${1}":443 2>/dev/null |
  openssl x509 -noout -enddate |
  sed -e 's#notAfter=##')

ssldate=$(date -d "${data}" '+%s')
nowdate=$(date '+%s')
diff="$((ssldate - nowdate))"

echo $((diff / 86400))
```

## Command usege
Generate custom root CA certificate

`openssl req -x509 -newkey rsa:4096 -keyout customRootCA.key -out customRootCA.cer -days 365`

Generate leaf certificate

`openssl req -x509 -newkey rsa:4096 -keyout leafCert.key -out leafCert.cer -days 365 -subj “/C=/ST=/L=/O=/CN=”`

Generate certificate request for the leaf certificate

`openssl x509 -x509toreq -days 365 -in leafCert.cer -signkey leafCert.key -out leafCert.req`

Sign the leaf certificate request with custom root CA certificate

`openssl x509 -req -days 365 -in leafCert.req -signkey customRootCA.key -out leafCert.cer`

Generate Private Key and Certificate using RSA 256 encryption (4096-bit key)

`openssl req -x509 -newkey rsa:4096 -keyout privatekey.pem -out certificate.pem -days 365`

Generate PKCS#12 (P12) file for cert; combines both key and certificate together

`openssl pkcs12 -export -inkey privatekey.pem -in certificate.pem -out cert.pfx`

Generate SHA256 Fingerprint for Certificate and export to a file

`openssl x509 -noout -fingerprint -sha256 -inform pem -in certificate.pem >> fingerprint.txt`

Generate SHA1 Fingerprint for Certificate and export to a file

`openssl x509 -noout -fingerprint -sha1 -inform pem -in certificate.pem >> fingerprint.txt`

## /dev/random/ /dev/urandom

The files in the directory /proc/sys/kernel/random (since 2.3.16) provide an additional interface to the /dev/random device. 
```sh
$ man 4 random | less +/proc\ Interface
$ base64 /proc/sys/kernel/random/uuid
ZTE2Y2U5ZWQtNDI3My00ZGYyLWI3YTYtZGY2OTdhZmU1MzJkCg==
```
[myths about urandom](https://www.2uo.de/myths-about-urandom/)

[when to use dev random over dev urandom in linux](https://crypto.stackexchange.com/questions/41595/when-to-use-dev-random-over-dev-urandom-in-linux)

[linux /dev/random safely generate random numbers](https://sockpuppet.org/blog/2014/02/25/safely-generate-random-numbers/)

[win CryptGenRandom function](https://learn.microsoft.com/en-us/windows/win32/api/wincrypt/nf-wincrypt-cryptgenrandom?redirectedfrom=MSDN)

## Links
### OpenSSL 
[Openssl essentials Digitalocean](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)

[How to generate a self signed ssl certificate Stackoverflow](https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl)

[How to generate a self signed ssl certificate Microsoft](https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-create-a-self-signed-certificate-in-azure-using-cloud/ba-p/401403)

### Cryptography 
[Cryptographic Best Practices](https://gist.github.com/adrianbiro/a58ba492cb9eeb96c7902dfac6b34fa7)

[NSA Cybersecurity Information Sheet The Commercial National Security Algorithm Suite 2.0 and Quantum Computing FAQ](https://media.defense.gov/2022/Sep/07/2003071836/-1/-1/0/CSI_CNSA_2.0_FAQ_.PDF)

[Size requirement for security](https://www.keylength.com/en/compare/)
