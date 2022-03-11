#!/bin/sh

set -e

{
  echo
  echo \# Bluetooth settings, added by freebsd-setup
  echo hcsecd_enable=\"YES\"
  echo bthidd_enable=\"YES\"
  echo
} >> /etc/rc.conf

touch /boot/loader.conf
{
  echo
  echo \# Bluetooth, added by freebsd-setup
  echo ng_ubt_load=\"YES\"
  echo
} >> /boot/loader.conf



