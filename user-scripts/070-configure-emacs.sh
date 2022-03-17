#!/bin/sh

set -e

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
rm -fr ~/.doom.d
git clone https://github.com/carlosalbertofilho/doom.d.git ~/.doom.d
