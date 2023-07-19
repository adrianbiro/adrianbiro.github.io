# Useful APIs

## Archive.org 
```sh
$  curl -s https://archive.org/wayback/available?url=https://www.nsa.gov/ia/programs/suiteb_cryptography/index.shtml \
    | jq -rc .archived_snapshots.closest.url
http://web.archive.org/web/20160409075837/https://www.nsa.gov/ia/programs/suiteb_cryptography/index.shtml

```

## Postman
[echo api](https://learning.postman.com/docs/developer/echo-api/) [echo api docs](https://www.postman.com/postman/workspace/published-postman-templates/documentation/631643-f695cab7-6878-eb55-7943-ad88e1ccfd65?ctx=documentation)

```sh
$ curl -s -H 'Accept-Encoding: gzip, deflate' 'postman-echo.com/get?name=bum&age=987654321'
{
  "args": {
    "name": "bum",
    "age": "987654321"
  },
  "headers": {
    "x-forwarded-proto": "http",
    "x-forwarded-port": "80",
    "host": "postman-echo.com",
    "x-amzn-trace-id": "Root=1-64b81db8-7b22c36a5d3b49302ae73580",
    "user-agent": "curl/7.81.0",
    "accept": "*/*",
    "accept-encoding": "gzip, deflate"
  },
  "url": "http://postman-echo.com/get?name=bum&age=987654321"

```