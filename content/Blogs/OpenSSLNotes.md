# OpenSSL Notes

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
  sed -e 's/notAfter=//')

ssldate=$(date -d "${data}" '+%s')
nowdate=$(date '+%s')
diff="$((ssldate - nowdate))"

echo $((diff / 86400))
```

## Command usege
Encrypt and decrypt a file

```sh
$ openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -salt -in zmaz.txt -out zmaz.txt.enc
$ openssl aes-256-cbc -md sha512 -pbkdf2 -iter 1000000 -d -in file.txt.enc -out file.txt.dec
```
Get content of certificate.

```sh
$ awk '/-{5}BEGIN/,/-{5}END/' < <(echo | openssl s_client -showcerts -connect google.com:443 2>/dev/null)
```

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

## Links
[Openssl essentials Digitalocean](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)

[How to generate a self signed ssl certificate Stackoverflow](https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl)

[How to generate a self signed ssl certificate Microsoft](https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-create-a-self-signed-certificate-in-azure-using-cloud/ba-p/401403)

[Debian openssl fiasco](https://research.swtch.com/openssl)

[OpenSSL Command-Line HOWTO Paul Heinlein ](https://www.madboa.com/geek/openssl/)

[Debugging Certificate Errors](https://www.netmeister.org/blog/debugging-certificate-errors.html)

[BadSSL for testing](https://badssl.com/)

[Test Certs Hardenize](https://www.hardenize.com/report/adrianbiro.github.com/1689742492)

[SSLlabs Server Test Qualys](https://www.ssllabs.com/ssltest/analyze.html?d=adrianbiro.github.com&latest)

[CLI SSLlabs Server Test](https://github.com/ssllabs/ssllabs-scan)

[SSL and TLS Deployment Best Practices](https://github.com/ssllabs/research/wiki/SSL-and-TLS-Deployment-Best-Practices)

[SSL Client Test](https://www.howsmyssl.com/)

[Keystore Explorer GUI client](https://github.com/kaikramer/keystore-explorer)

[Whatsthatcert Online Cert Probe Tool](https://www.netmeister.org/whatsthatcert/)