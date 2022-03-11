#!/bin/sh

set -e

# Not *strictly* necessary for DRM, but alongside that allows WebRTC
# to work.
pkg install -y pulseaudio

{
  echo
  echo \# DRM access for non-root users, added by freebsd-setup
  echo \# Thanks to https://forums.freebsd.org/threads/various-programs-libgl-error-failed-to-open-drm-device.62446/
  echo add path 'dri/*' mode 0666 group operator
  echo
} >> /etc/devfs.rules
