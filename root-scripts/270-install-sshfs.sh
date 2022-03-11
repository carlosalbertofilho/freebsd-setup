#!/bin/sh

set -e

pkg install -y fusefs-sshfs

touch /boot/loader.conf
{
  echo
  echo \# Fuse, added by freebsd-setup
  echo fuse_load=\"YES\"
  echo
} >> /boot/loader.conf


