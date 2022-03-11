#!/bin/sh

set -e

pkg install -y \
    avahi \
    avahi-app \
    avahi-libdns \
    nss_mdns

{
  echo
  echo \# MDNS settings, added by freebsd-setup
  echo avahi_daemon_enable=\"YES\"
  echo avahi_dnsconfd_enable=\"YES\"
  echo
} >> /etc/rc.conf

{
  echo \#
  echo \# nsswitch.conf: created by freebsd-setup
  echo \#
  echo group: compat
  echo group_compat: nis
  echo hosts: files mdns dns
  echo netgroup: compat
  echo networks: files
  echo passwd: compat
  echo passwd_compat: nis
  echo shells: files
  echo services: compat
  echo services_compat: nis
  echo protocols: files
  echo rpc: files
} > /etc/nsswitch.conf
