#!/bin/sh

set -e

touch /etc/make.conf

{
  echo
  echo \# Custom build options, added by freebsd-setup
  echo BATCH=yes
  echo
} >> /etc/make.conf
