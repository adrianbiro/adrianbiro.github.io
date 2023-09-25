# Networing Notes

[Basic Network Troubleshooting](https://www.netmeister.org/blog/basic-network-troubleshooting.html)

## ip

### ip-route

To avoid a non-deterministic lag between the time that a new route is entered into the kernel routing tables and the time that a new lookup in those route tables is performed, use on Linux kernel version < 3.6
[routing cache](http://linux-ip.net/html/routing-cache.html)

```sh
$ ip route flush cache
$ ip route get 10.0.1.138
10.0.1.138 dev wlp0s20f3 src 10.0.1.21 uid 1000 
    cache
```

## Show Interface

```sh
ip addr | awk -F':' '/^[1-9]/{$2=$2; print $2}'
ip link show
netstat -i
nmcli connection show
```

## tcpdump

[Tcpdump tutorial](https://danielmiessler.com/p/tcpdump/)

trafic on wifi interface UDP

```sh
sudo tcpdump -i $(ip addr | awk -F':' '/^[1-9]/{print $2}'| grep wlp) udp -v
```

ssh trafic

```sh
sudo tcpdump 'tcp port 22' -l -e
```

```sh
sudo tcpdump -n ip and udp and port 53
```

## ss

```sh
ss -4
sudo ss -tnlp
```
