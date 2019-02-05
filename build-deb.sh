#!/bin/bash
set -e

###########
#
# Script for building bitwarden_rs *.deb package with cargoi-deb
# https://github.com/mmstick/cargo-deb
#
######

# Patch Cargo.toml with current version number and cargo-deb specific options
patch Cargo.toml < Cargo.toml.patch

# Compile and packages crate
cargo deb

