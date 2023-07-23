#!/usr/bin/env bash
### every exit != 0 fails the script

### This is Dooqod customize script for Oraclelinux 8 Adwaita-dark theme

set -e

echo "Customize Xfce4 UI components"
if [[ "${DISTRO}" == @(oracle7|oracle8|oracle9) ]]; then
  wget -O /tmp/Adwaita-Dark.tar http://scripts.dooqod.com/v3/distrib/desktop/themes/Adwaita-Dark.tar
  tar -xf /tmp/Adwaita-Dark.tar -C /usr/share/themes
  xfconf-query --channel xsettings --property /Net/ThemeName --set "Adwaita-Dark"
fi