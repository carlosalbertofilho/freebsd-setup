#!/bin/sh

set -e

{
  echo
  echo \# Use custom rules, added by freebsd-setup
  echo devfs_system_ruleset="system"
} >> /etc/rc.conf
