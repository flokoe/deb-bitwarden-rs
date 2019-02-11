# bitwarden_rs Debian Package Repository
deb-bitwarden-rs is a Debian repository for more convenient installation and updating of [bitwarden_rs](https://github.com/dani-garcia/bitwarden_rs) on debian based Linux distributions.

At this moment this repository only contains bitwarden_rs v1.6.1 for Debian Stretch and the amd64 architecture.

# Install
Get the public GPG key of this repository:
```
curl https://raw.githubusercontent.com/flokoe/deb-bitwarden-rs/deb/deb-bitwarden-rs.gpg.key | apt-key add -
```
Add this repository to apt's search list:
```
apt install apt-transport-https
echo "deb [arch=amd64] https://raw.githubusercontent.com/flokoe/deb-bitwarden-rs/deb stretch main" > /etc/apt/sources.list.d/deb-bitwarden-rs.list
apt update
```
Install bitwarden_rs:
```
apt install bitwarden-rs
```
**Notice:** The package and binary was renamed to "bitwarden-rs" (with a dash instead of an underscore) due to debian package naming restrictions.

# About
bitwarden_rs was created and is being developed by [Daniel García](https://github.com/dani-garcia). This debian package and repository is being maintained by [Florian Koehler](https://github.com/flokoe).
