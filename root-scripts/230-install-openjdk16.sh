#!/bin/sh

set -e

pkg install -y openjdk16 openjdk16-jre

echo fdesc    /dev/fd        fdescfs        rw    0    0 >> /etc/fstab
echo proc     /proc          procfs         rw    0    0 >> /etc/fstab
