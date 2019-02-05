#!/bin/bash
set -e

###########
#
# Script for building bitwarden_rs *.deb package with cargoi-deb
# https://github.com/mmstick/cargo-deb
#
######

# Donwload a release
wget "https://github.com/dani-garcia/bitwarden_rs/releases/tag/$1"

# untar
tar xzvf "$1.tar.gz"

# move files
mv "$1.tar.gz./" ..

# Patch Cargo.toml with current version number and cargo-deb specific options
patch Cargo.toml < Cargo.toml.patch

# Compile and packages crate
cargo deb

