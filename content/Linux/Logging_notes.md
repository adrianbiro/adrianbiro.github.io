# Logging Notes

[logger](https://linux.die.net/man/1/logger)

[systemd-cat](https://www.freedesktop.org/software/systemd/man/latest/systemd-cat.html)

```sh
00 4  *   *   *     msktutil --auto-update --verbose --computer-name squidproxy-k | logger -t msktutil
```
