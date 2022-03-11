#!/bin/sh

set -e

pkg install -y \
    virtualbox-ose \
    virtualbox-ose-additions \
    virtualbox-ose-kmod

{
  echo
  echo \# VirtualBox settings, added by freebsd-setup
  echo vboxnet_enable=\"YES\"
  echo
} >> /etc/rc.conf

touch /boot/loader.conf
{
  echo
  echo \# VirtualBox, added by freebsd-setup
  echo vboxdrv=\"YES\"
  echo
} >> /boot/loader.conf

# WTF?
sudo chmod +x /usr/local/lib/virtualbox/VirtualBox

