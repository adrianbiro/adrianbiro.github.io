# OpenSSL tips
## [Certificate after DNS change](https://serverfault.com/questions/750902/how-to-use-lets-encrypt-dns-01-challenge-validation#812038)
`certbot -d mydomainename.com --manual --preferred-challenges dns certonly`

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

Alternatively, setting the `-newkey`` parameter to `rsa:2048`` will generate a 2048-bit key.
Generate PKCS#12 (P12) file for cert; combines both key and certificate together

`openssl pkcs12 -export -inkey privatekey.pem -in certificate.pem -out cert.pfx`

Generate SHA256 Fingerprint for Certificate and export to a file

`openssl x509 -noout -fingerprint -sha256 -inform pem -in certificate.pem >> fingerprint.txt`

Generate SHA1 Fingerprint for Certificate and export to a file

`openssl x509 -noout -fingerprint -sha1 -inform pem -in certificate.pem >> fingerprint.txt`

## Links 
[Digitalocean](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)

[Stackoverflow](https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl)

[Microsoft](https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-create-a-self-signed-certificate-in-azure-using-cloud/ba-p/401403)
