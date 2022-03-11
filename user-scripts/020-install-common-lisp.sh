#!/bin/sh

set -e

sudo pkg install -y \
     autoconf \
     gmake

git clone -b release https://github.com/roswell/roswell.git
cd roswell
sh bootstrap
./configure
make
sudo make install
ros setup
ros install sbcl-bin
ros use sbcl-bin

ros install \
    slime
