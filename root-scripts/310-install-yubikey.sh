#!/bin/sh

set -e

pkg install -y \
    libyubikey \
    pcsc-lite \
    pcsc-tools \
    pinentry \
    pinentry-gtk2 \
    py38-yubikey-manager \
    yubikey-manager-qt \
    yubioath-desktop

{
  echo
  echo \# Smart Card Daemon settings, added by freebsd-setup
  echo pcscd_enable=\"YES\"
  echo
} >> /etc/rc.conf
