#!/bin/bash
#set -e

###########
#
# Script for building bitwarden_rs *.deb package with cargoi-deb
# https://github.com/mmstick/cargo-deb
#
######


if [ -z "$1" ]; then
  echo "Please provide a version number in form of 'x.x.x'."
  exit 5
else
  release="$1"
  archive="$release.tar.gz"
  url="https://github.com/dani-garcia/bitwarden_rs/archive/$archive"
fi

# Clearing working directory
read -rp "Do you want to clear the current working directory? y/n [n]: " clearDir

case "$clearDir" in
  "y")
    echo "Clearing current working directory..."
    git clean -f
    ;;
  *)
    echo "Leave directory as it is."
    ;;
esac

# Donwload archive
echo "Trying to download '$url' ..."

if [ -f "$archive" ]; then
  echo "The file '$archive' already exists, skipping download."
else
  wget --quiet "$url"

  if [ $? -ne 0 ]; then
    echo "Oops, something went wrong. Please check your version number and the URL above."
    exit 6
  else
    echo "Done downloading."
  fi
fi

# untar
echo "Extracting..."
tar xzvf "$archive" > /dev/null

# move files
rsync -a bitwarden_rs-$release/./ . && rm -r bitwarden_rs-$release

# Patch Cargo.toml with current version number and cargo-deb specific options
echo "Patching Cargo.toml ..."
patch --quiet Cargo.toml < Cargo.toml.patch

# Compile and packages crate
echo "Start building..."
sleep 2

cargo deb

exit 0
