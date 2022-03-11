#!/bin/sh

# Thanks to https://forums.freebsd.org/threads/61501/

set -e

wget https://github.com/google/fonts/archive/main.zip
unzip main.zip
rm main.zip
rm -rf ~/.fonts
mv fonts-main ~/.fonts

mkdir -p ~/.config
ln -s ~/freebsd-setup/conf/fontconfig ~/.config/fontconfig

fc-cache -f
