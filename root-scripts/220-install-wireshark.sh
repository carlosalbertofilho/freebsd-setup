#!/bin/sh

set -e

pkg install -y wireshark

{
  echo
  echo \# bpf config, added by freebsd-setup
  echo \# Thanks to https://forums.freebsd.org/threads/20109/#post-114296
  echo own     /dev/bpf0       root:wheel
  echo perm    /dev/bpf0       0640
  echo own     /dev/bpf1       root:wheel
  echo perm    /dev/bpf1       0640
  echo own     /dev/bpf2       root:wheel
  echo perm    /dev/bpf2       0640
  echo
} >> /etc/devfs.conf
