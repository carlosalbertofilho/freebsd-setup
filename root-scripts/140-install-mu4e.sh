#!/bin/sh

set -e

pkg install -y \
  isync \
  w3m

cd /usr/ports/mail/mu

make install
cp -R work/mu-*/mu4e /usr/local/share/emacs/site-lisp
