#!/bin/sh

set -e

echo
echo Clone sources Ports and Kernel of the FreeBSD
echo

git clone https://git.freebsd.org/src.git /usr/src
git clone https://git.freebsd.org/ports.git /usr/ports

touch /etc/make.conf

{
  echo
  echo \# Custom build options, added by freebsd-setup
  echo BATCH=yes
  echo
  echo \# native CPU type
  echo CPUTYPE?=native
  echo \# CPU optimations
  echo CFLAGS=-O2 -pipe -fno-strict-aliasing
  echo COPTFLAGS=-O2 -pipe -fno-strict-aliasing
  echo \# enable speed
  echo MALLOC_PRODUCTION=\"YES\"
} >> /etc/make.conf

touch /etc/src.conf

{
    echo \# NO DEBUG
    echo WITHOUT_ASSERT_DEBUG=\"ON\"
} >> /etc/src.conf

cd /usr/src
make -j12 buildworld buildkernel KERNCONF=GENERIC-NODEBUG

echo
echo Reboot your system
echo
shutdown -r now
