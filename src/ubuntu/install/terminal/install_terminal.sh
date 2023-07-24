#!/usr/bin/env bash
set -e

terminal_desktop_path="xfce4-terminal-emulator.desktop"

if [ -e "/usr/share/applications/xfce4-terminal-emulator.desktop" ]; then
    terminal_desktop_path="xfce4-terminal-emulator.desktop"
fi

if [ -e "/usr/share/applications/exo-terminal-emulator.desktop" ]; then
    terminal_desktop_path="exo-terminal-emulator.desktop"
fi

cp /usr/share/applications/$terminal_desktop_path $HOME/Desktop
chmod +x $HOME/Desktop/$terminal_desktop_path
chown 1000:1000 $HOME/Desktop/$terminal_desktop_path
