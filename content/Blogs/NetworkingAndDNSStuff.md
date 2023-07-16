# Networking and DNS stuff

## dig
```sh
$ dig -r ptr 185.199.110.153.in-addr.arpa
```
Reverse DNS lookups
```sh
$ dig -x 185.199.110.153
```
Specify DNS server
```sh
$ dig adrianbiro.github.io +noall +stat
$ dig @1.1.1.1 adrianbiro.github.io +noall +stat
```
DNS record

* A Record: Links the domain to an IPv4.
* MX Record: Mail exchange records direct emails sent to domains to the correct mail server.
* NS Record: Name server records to a set of DNS servers.
* TXT Record: Text records store. 
* SOA Record: Start of authority records like, primary name server, the responsible party, a timestamp for changes, the frequency of zone refreshes, and a series of time limits for retries and abandons.
* TTL: Time to live in cache each for DNS query. 
* ANY: Return every type of DNS record it can find.
```sh
$ dig github.com TTL
$ dig github.com CNAME
$ dig github.com TXT
```
[Access DNS zone data for the different top-level domains](https://github.com/jschauma/tld-zoneinfo)

[IANA domains root files](https://www.iana.org/domains/root/files)
```bash
$ dig +noall +answer +noidnout +onesoa @f.root-servers.net . AXFR
$ dig +short ns edu.
$ dig +noall +answer +noidnout +onesoa @$(dig +short ns arpa. | head -1) arpa AXFR
```
