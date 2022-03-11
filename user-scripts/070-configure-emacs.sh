#!/bin/sh

set -e

git clone https://gitlab.com/duncan-bayne/emacs-setup.git ~/emacs-setup
ln -s ~/emacs-setup/emacs ~/.emacs
ln -s ~/emacs-setup/emacs.d ~/.emacs.d
