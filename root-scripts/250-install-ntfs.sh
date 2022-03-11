#!/bin/sh

set -e

pkg install -y \
    fusefs-ntfs

touch /etc/rc.conf
{
  echo
  echo \# FuseFS services, added by freebsd-setup
  echo fusefs_enable=\"YES\"
  echo
} >> /etc/rc.conf
