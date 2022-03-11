#!/bin/sh

set -e

rm -f ~/.stumpwmrc
ln -s ~/freebsd-setup/conf/stumpwm/stumpwmrc ~/.stumpwmrc

echo exec stumpwm > ~/.xinitrc
chmod 0755 ~/.xinitrc

echo "gtk-icon-theme-name=\"gnome\"" >> ~/.gtkrc-2.0
