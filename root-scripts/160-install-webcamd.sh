#!/bin/sh

set -e

pkg install -y \
    cheese

kldload cuse

touch /boot/loader.conf
{
  echo
  echo \# Userland character device library, added by freebsd-setup
  echo cuse_load=\"YES\"
  echo
} >> /boot/loader.conf

touch /etc/rc.conf
{
  echo
  echo \# Webcam services, added by freebsd-setup
  echo webcamd_enable=\"YES\"
  echo
} >> /etc/rc.conf

service devd restart


