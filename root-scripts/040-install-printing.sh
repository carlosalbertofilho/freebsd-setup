#!/bin/sh

set -e

pkg install -y \
    cups \
    print/cups-smb-backend \
    print/gutenprint \
    print/hplip

{
  echo
  echo \# CUPS configuration, added by freebsd-setup
  echo cupsd_enable="YES"
} >> /etc/rc.conf

{
  echo
  echo \# CUPS configuration, added by freebsd-setup
  echo \[system=10\]
  echo add path \'unlpt*\' mode 0660 group cups
  echo add path \'ulpt*\' mode 0660 group cups
  echo add path \'lpt*\' mode 0660 group cups
} >> /etc/devfs.rules

# Note this overwrites cups.sock!
{
  echo ServerName /var/run/cups/cups.sock
} > /usr/local/etc/cups/client.conf

service cupsd restart
touch /usr/local/etc/smb.conf
