#!/usr/bin/env bash

### Dooqod ###
# Updating the novnc forked from Kasm fork of novnc ...

# Repo: https://github.com/sfast/codelabs-novnc/releases/tag/dk8-v1.1.1
# Replacing original files under kasmweb with new ones from our release tag.
# We made copy paste and customized some more things like loaders etc ...

mv /usr/share/kasmvnc/www  mv /usr/share/kasmvnc/www-original-bak

mkdir /usr/share/kasmvnc/www

curl -o /tmp/dooqod-novnc-dk8-v1.1.1.tar.gz http://scripts.dooqod.com/v3/distrib/novnc/dooqod-novnc-dk8-v1.1.1.tar.gz

tar -C /usr/share/kasmvnc/www --strip-components=1 -xzf /tmp/dooqod-novnc-dk8-v1.1.1.tar.gz

rm -f /tmp/dooqod-novnc-dk8-v1.1.1.tar.gz