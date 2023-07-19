# DNS stuff

[Use of DNS Resolvers for World](https://stats.labs.apnic.net/rvrs)

[Compare public DNS resolver results Online Tool](https://www.netmeister.org/puddy/)

[Google DNS API](https://dns.google/query?name=github.com&rr_type=SOA&ecs=), [API Docs](https://developers.google.com/speed/public-dns/docs/doh/json#edns) Endpoint here [https://dns.google/resolve?name=google.com&type=TXT](https://dns.google/resolve?name=google.com&type=TXT)

[Causes And Mitigations Of DNS Latency](https://developers.google.com/speed/public-dns/docs/performance#introduction_causes_and_mitigations_of_dns_latency)

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
[DNS Resource Records](https://www.netmeister.org/blog/dns-rrs.html)

[DNS Records Cloudflare](https://www.cloudflare.com/learning/dns/dns-records/)

* A Record: Links the domain to an IPv4.
* MX Record: Mail exchange records direct emails sent to domains to the correct mail server.
* NS Record: Name server records to a set of DNS servers.
* TXT Record: Text records store. 
* SOA Record: Start of authority records like, primary name server, the responsible party, a timestamp for changes, the frequency of zone refreshes, and a series of time limits for retries and abandons.
* TTL: Time to live in cache each for DNS query. 
* ANY: Return every type of DNS record it can find.
[dig + spf](https://www.netmeister.org/blog/spf.html)

[Sender Policy Framework (SPF) definition via a DNS TXT](https://github.com/jschauma/spf)
```sh
$ dig github.com TTL
$ dig github.com CNAME
$ dig github.com TXT
```
On [windows](https://learn.microsoft.com/en-us/powershell/module/dnsclient/resolve-dnsname?view=windowsserver2022-ps) or use [dog](https://github.com/ogham/dog)
```powershell
Resolve-DnsName -Name google.com -Type a
```
[Access DNS zone data for the different top-level domains](https://github.com/jschauma/tld-zoneinfo)

[IANA domains root files](https://www.iana.org/domains/root/files)
```bash
$ dig +noall +answer +noidnout +onesoa @f.root-servers.net . AXFR
$ dig +short ns edu.
$ dig +noall +answer +noidnout +onesoa @$(dig +short ns arpa. | head -1) arpa AXFR
```
```sh
$ nslookup -query=a google.com
$ dig a +noall +answer google.com
$ host -t a google.com
```


## URL
[URLs: It's complicated...](https://www.netmeister.org/blog/urls.html)