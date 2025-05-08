+++
title = 'Docker and Podman Notes'
date = 2023-01-15T09:00:00-07:00
draft = false
tags = ['docker', 'podman,', 'docker compose', 'automation CI/CD stuff']
+++
# Docker and Podman Notes

## Podman image with systemd

```dockerfile
FROM debian:bookworm
RUN apt-get update && apt-get install -y systemd
CMD [ "/lib/systemd/systemd" ]
```

```sh
podman top 6e57
USER        PID         PPID        %CPU        ELAPSED        TTY         TIME        COMMAND
root        1           0           0.000       15.762981116s  ?           0s          /lib/systemd/systemd 
root        15          1           0.000       14.763070902s  ?           0s          /lib/systemd/systemd-journald 
messagebus  23          1           0.000       14.763128842s  ?           0s          /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only 
root        24          1           0.000       14.763183451s  ?           0s          /lib/systemd/systemd-logind 
root        26          1           0.000       14.763239641s  pts/0       0s 
```

## Call Hosts Localhost IP from a Docker Container

From host `python3 -m http.server --bind "$(docker network inspect bridge --format='{{(index .IPAM.Config 0).Gateway}}')"`

```bash
#loopback
$ docker run --add-host host.docker.internal:host-gateway --rm -it ubuntu bash
root@6d84d35a7553:/# grep 'host.docker.internal' /etc/hosts
172.17.0.1  host.docker.internal

root@6d84d35a7553:/# ping host.docker.internal -c 2
PING host.docker.internal (172.17.0.1): 56 data bytes
64 bytes from 172.17.0.1: icmp_seq=0 ttl=64 time=0.110 ms
64 bytes from 172.17.0.1: icmp_seq=1 ttl=64 time=0.096 ms
--- host.docker.internal ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max/stddev = 0.096/0.103/0.110/0.000 ms

root@6d84d35a7553:/# curl 172.17.0.1:8000 -I
HTTP/1.0 200 OK
Server: SimpleHTTP/0.6 Python/3.10.12
Date: Sun, 19 Nov 2023 10:38:41 GMT
Content-type: text/html; charset=utf-8
Content-Length: 342

```
