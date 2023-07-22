# Apt notes

```sh
sudo apt --fix-broken install
sudo apt-get -f install
sudo apt-get purge linux-image-6.1.0-10-amd
```
```sh
sudo dpkg -C
sudo apt install --reinstall -o Dpkg::Options::="--force-confmiss" linux-image-6.1.0-10-amd
sudo apt --fix-broken install
sudo apt autoremove
```
```sh
sudo apt-get update
sudo dpkg -P linux-image-6.1.0-10-amd
sudo dpkg --configure -a
sudo apt install linux-image-6.1.0-10-amd
```
```sh
sudo rm /var/lib/dpkg/info/linux-image-6.1.0-10-amd*
sudo dpkg --configure -a
sudo apt-get update
sudo dpkg -P linux-image-6.1.0-10-amd
sudo apt install linux-image-6.1.0-10-amd
```

## Links
[Fix Non-Free Firmware Moved](https://www.debian.org/releases/bookworm/amd64/release-notes/ch-information.en.html#non-free-split)