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
Verify `S/MIME` see [S/MIME in Exchange Online](https://learn.microsoft.com/en-us/exchange/security-and-compliance/smime-exo/configure-smime-exo)
```sh
$ openssl smime -verify -inform pem -CAfile cert.pem
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

## Certificate Authority With Openssl

**Before you use it, read** `man openssl-ca | less +?WARNINGS`

Tested on OpenSSL [`1.1.1`](https://www.openssl.org/docs/man1.1.1/man1/ca.html) and [`3.0.2`](https://www.openssl.org/docs/man3.0/man1/openssl-ca.html)

OpenSSL root CA configuration file `/root/ca/root.cnf` `man OPENSSL-CMDS` or `man ca` `man openssl-ca`  
```
[ ca ]
default_ca = CA_root

[ CA_root ]
dir               = /root/ca
certs             = $dir/certs
crl_dir           = $dir/crl
new_certs_dir     = $dir/newcerts
database          = $dir/index.txt
serial            = $dir/serial
RANDFILE          = $dir/private/.rand

private_key       = $dir/root_ca_key
certificate       = $dir/root_ca.crt

# certificate revocation list
crlnumber         = $dir/crlnumber
crl               = $dir/crl/ca.crl.pem
crl_extensions    = crl_ext
default_crl_days  = 30

default_md        = sha256

name_opt          = ca_default
cert_opt          = ca_default
default_days      = 25202
preserve          = no
policy            = policy_strict

[ policy_strict ]
# The root CA should only sign intermediate certificates that match cf. POLICY FORMAT in man openssl-ca.
countryName             = match
organizationName        = match
commonName              = supplied

[ req ]
# Options for req tool cf. man openssl-req.
default_bits        = 4096
distinguished_name  = req_distinguished_name
string_mask         = utf8only

default_md          = sha256

x509_extensions     = v3_ca

[ req_distinguished_name ]
# See <https://en.wikipedia.org/wiki/Certificate_signing_request>.
commonName                      = Common Name
countryName                     = Country Name (2 letter code)
0.organizationName              = Organization Name

[ v3_ca ]
# man x509v3_config
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true
keyUsage = critical, digitalSignature, cRLSign, keyCertSign

[ v3_intermediate_ca ]
# man x509v3_config.
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = critical, CA:true, pathlen:0
keyUsage = critical, digitalSignature, cRLSign, keyCertSign
```
```sh
$ mkdir -p /root/ca/{certs,crl,newcerts,private}
$ touch /root/ca/index.txt
$ echo 1420 > serial
```
### Private key 
```sh
openssl genrsa -aes256 -out /root/ca/root_ca_key 4096
```
Certificate, used mostly by clients
```sh
openssl req -config /root/ca/root.cnf -key /root/ca/root_ca_key -days 25202 -new -x509 -sha256 -extensions v3_ca -out /root/ca/root_ca.crt
```
Examine the key 
```sh
$ openssl x509 -noout -text -in /root/ca/root_ca.crt
```
### Intermediate Certificate
Private key 
```sh
$ openssl genrsa -aes256 -out /root/ca/intermediate_ca_key 2048
```
Certificate-signing-request (CSR) for the intermediate CA key
```sh
$ openssl req -config /root/ca/root.cnf -new -sha256 -key /root/ca/intermediate_ca_key -out /root/ca/intermediate_ca.csr.pem
```
Sign the CSR with the root key
```sh
$ openssl ca -config /root/ca/root.cnf -keyfile /root/ca/root_ca_key -cert /root/ca/root_ca.crt -extensions v3_intermediate_ca -days 3650 -notext -md sha256 -in /root/ca/intermediate_ca.csr.pem -out /root/ca/intermediate_ca.crt
```
Examine with 
```sh
$ openssl x509 -noout -text -in /root/ca/intermediate_ca.crt
```

[Smallstep](https://smallstep.com/docs/step-ca/#provisioners)

[Smallstep Configure Step CA for ACME](https://smallstep.com/docs/step-ca/acme-basics/#configure-step-ca-for-acme) 

[Small CA Yubikey](https://smallstep.com/docs/step-ca/configuration/#yubikey-piv)

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

[DNS parameters IANA (with rfc)](https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml)

[OpenSSl WPA2-Enterprise with FreeRadius](https://forums.freebsd.org/threads/howto-wpa2-enterprise-with-freeradius.28467/)

