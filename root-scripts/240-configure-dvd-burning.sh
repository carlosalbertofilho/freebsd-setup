#!/bin/sh

set -e

touch /boot/loader.conf
{
  echo
  echo \# DVD writing, added by freebsd-setup
  echo hw.ata.atapi_dma=\"1\"
  echo
} >> /boot/loader.conf

{
  echo
  echo \# CD and DVD write access for non-root users, added by freebsd-setup
  echo perm    cd0     0666
  echo perm    pass1   0666
  echo
} >> /etc/devfs.conf




