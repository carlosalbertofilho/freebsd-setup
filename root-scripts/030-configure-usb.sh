#!/bin/sh

set -e

{
  echo
  echo \# USB access for wheel users, added by freebsd-setup
  echo \# Thanks to http://mcuee.blogspot.com.au/2007/11/setting-up-permissions-for-usb-ports-to.html
  echo \[usb_devices=20\]
  echo add path \'ugen*\' mode 0660 group wheel
  echo add path \'da*s*\' mode 0660 group wheel
  echo add path \'cuaU*\' mode 0660 group operator
  echo add path \'uhid*\' mode 0660 group operator
  echo add path \'usbctl*\' mode 0660 group operator
  echo add path \'usb/*\' mode 0660 group operator
  echo add path \'video*\' mode 0660 group operator
  echo add path \'ng_ubt*\' mode 0660 group operator
  echo add path \'cd*\' mode 0660 group operator
  echo add path \'da*\' mode 0660 group operator
  echo add path \'pass*\' mode 0660 group operator
  echo add path \'xpt*\' mode 0660 group operator
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
  echo perm cuad0 0660
  echo own cuad0 root:operator
  echo perm cuad1 0660
  echo own cuad1 root:operator
  echo perm cuau0 0660
  echo own cuau0 root:operator
  echo perm cuau1 0660
  echo own cuau1 root:operator
  echo perm cd0 0660
  echo own cd0 root:operator
  echo perm cd1 0660
  echo own cd1 root:operator
  echo perm fd0 0660
  echo own fd0 root:operator
  echo perm fd1 0660
  echo own fd1 root:operator
} >> /etc/devfs.conf
