# bitwarden_rs Debian Package Repository
deb-bitwarden-rs is a Debian repository for more convenient installation and updating of [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs) on debian based Linux distributions.

At this moment this repository only contains bitwarden_rs v1.7.0 for Debian Stretch and the amd64 architecture.

# Install
Install bitwarden_rs:
```
apt install bitwarden-rs
```
**Notice:** The package and binary was renamed to "bitwarden-rs" (with a dash instead of an underscore) due to debian package naming restrictions.

## Install web vault
Maybe I will create a deb package for the web vault as well, but for now you have to do it manually.
Dont' worry, its not that hard!

Get the *.tar.gz from https://github.com/dani-garcia/bw_web_builds/releases. For e.g. version 2.8.0d
```
wget https://github.com/dani-garcia/bw_web_builds/releases/download/v2.8.0d/bw_web_v2.8.0d.tar.gz
```
Extract the archive and move the file to the right location:
```
mkdir web-vault

cd web-vault

tar xzvf ../bw_web_v2.8.0d.tar.gz

cd ..

mkdir -p /usr/share/bitwarden-rs

mv web-vault /usr/share/bitwarden-rs/
```
Now set the right permissions:
```
chown -R bitwarden-rs: /usr/share/bitwarden-rs
```
You are almost done. Just activate the web vault in the config file `/etc/bitwarden-rs/env` and reload bitwarden-rs:
```
## Web vault settings
WEB_VAULT_FOLDER=/usr/share/bitwarden-rs/web-vault/
WEB_VAULT_ENABLED=true
```

# About
bitwarden_rs was created and is being developed by [Daniel García](https://github.com/dani-garcia). This debian package and repository is being maintained by [Florian Koehler](https://github.com/flokoe).
