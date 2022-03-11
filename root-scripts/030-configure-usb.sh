#!/bin/sh

set -e

{
  echo
  echo \# USB access for wheel users, added by freebsd-setup
  echo \# Thanks to http://mcuee.blogspot.com.au/2007/11/setting-up-permissions-for-usb-ports-to.html
  echo \[usb_devices=20\]
  echo add path \'ugen*\' mode 0660 group wheel
  echo add path \'da*s*\' mode 0660 group wheel
  echo
} >> /etc/devfs.rules

{
  echo
  echo \# USB access for wheel users, added by freebsd-setup
  echo \# Thanks to http://mcuee.blogspot.com.au/2007/11/setting-up-permissions-for-usb-ports-to.html
  echo perm usb0 0660
  echo own usb0 root:wheel
  echo perm usb1 0660
  echo own usb1 root:wheel
  echo
} >> /etc/devfs.conf

