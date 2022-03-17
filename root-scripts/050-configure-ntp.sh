#!/bin/sh

set -e

{
  echo
  echo \# NTP settings, added by freebsd-setup
  echo ntpd_enable=\"YES\"
  echo ntpdate_enable=\"YES\"
  echo ntpdate_flags=\"-u a.ntp.br\"
  echo
} >> /etc/rc.conf
