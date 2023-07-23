#!/usr/bin/env bash
set -e

cp /usr/share/applications/xfce4-terminal-emulator.desktop $HOME/Desktop
chmod +x $HOME/Desktop/xfce4-terminal-emulator.desktop
chown 1000:1000 $HOME/Desktop/xfce4-terminal-emulator.desktop
