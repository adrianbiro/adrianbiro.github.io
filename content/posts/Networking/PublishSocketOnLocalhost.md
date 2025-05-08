# Publish unix socket on localhost
To make docker API REST calls on `0.0.0.0:2376` run `sudo ncat -kl -p 2376 -c 'ncat -U /run/docker.sock'`

It is useful when you need to write a plugin and inspect API, yes you can use `curl` directly on `socket`, as shown in the examples below, but there is no option to use Postman this way, (at least I do not know any.)
###  
Selext image
```bash
curl -s --unix-socket /var/run/docker.sock   0.0.0.0/v1.42/images/json | jq -r '.[] | select(.RepoTags[] | test("alpine:*")) | .RepoTags[0]'
```
Get `id`, `inspect`, show `stat` and `kill` container.
```bash
$ id="$(curl -s --unix-socket /var/run/docker.sock 0.0.0.0/v1.42/containers/json | jq -r '.[0].Id')"
$ curl -s --unix-socket "/var/run/docker.sock 0.0.0.0/v1.42/containers/${id}/json"
$ curl -s --unix-socket "/var/run/docker.sock 0.0.0.0/v1.42/containers/${id}/stats" 
$ curl -s -XPOST --unix-socket "/var/run/docker.sock 0.0.0.0/v1.42/containers/${id}/kill"
```
[docker API create container](https://docs.docker.com/engine/api/v1.42/#tag/Container/operation/ContainerCreate)
[docker SDK examples](https://docs.docker.com/engine/api/sdk/examples/)

