#!/bin/sh

set -e

pkg install -y \
    cheese

kldload cuse


touch /etc/rc.conf
{
  echo
  echo \# Webcam services, added by freebsd-setup
  echo webcamd_enable=\"YES\"
  echo webcamd_0_flags=\"-H -d ugen0.6\"
  echo
} >> /etc/rc.conf

service devd restart


