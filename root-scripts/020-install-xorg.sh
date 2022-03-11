#!/bin/sh

set -e

# Generic xorg utilities.
pkg install -y \
    scrot \
    stumpwm \
    unison \
    x11-drivers/xf86-input-keyboard \
    x11-drivers/xf86-input-mouse \
    xbrightness \
    xclip \
    xmixer \
    xorg \
    xscreensaver \
    xterm

# XFCE4 desktop for pairing, etc.
pkg install -y \
    thunar \
    adwaita-icon-theme \
    gnome-icon-theme \
    gnome-icon-theme-extras \
    gnome-icon-theme-symbolic \
    hicolor-icon-theme \
    lxde-icon-theme \
    mate-icon-theme \
    mate-icon-theme-faenza \
    thunar \
    thunar-archive-plugin \
    thunar-media-tags-plugin \
    thunar-vcs-plugin \
    xfce4-appfinder \
    xfce4-battery-plugin \
    xfce4-bsdcpufreq-plugin \
    xfce4-calculator-plugin \
    xfce4-clipman-plugin \
    xfce4-conf \
    xfce4-cpugraph-plugin \
    xfce4-dashboard \
    xfce4-datetime-plugin \
    xfce4-desktop \
    xfce4-dev-tools \
    xfce4-dict-plugin \
    xfce4-diskperf-plugin \
    xfce4-fsguard-plugin \
    xfce4-genmon-plugin \
    xfce4-mailwatch-plugin \
    xfce4-mount-plugin \
    xfce4-mpc-plugin \
    xfce4-netload-plugin \
    xfce4-notes-plugin \
    xfce4-notifyd \
    xfce4-panel \
    xfce4-panel-profiles \
    xfce4-power-manager \
    xfce4-pulseaudio-plugin \
    xfce4-screenshooter-plugin \
    xfce4-session \
    xfce4-settings \
    xfce4-smartbookmark-plugin \
    xfce4-systemload-plugin \
    xfce4-taskmanager \
    xfce4-terminal \
    xfce4-time-out-plugin \
    xfce4-timer-plugin \
    xfce4-tumbler \
    xfce4-verve-plugin \
    xfce4-volumed-pulse \
    xfce4-wavelan-plugin \
    xfce4-weather-plugin \
    xfce4-whiskermenu-plugin \
    xfce4-wm \
    xfce4-wm-themes \
    xfce4-xkb-plugin

touch /etc/rc.conf
{
  echo
  echo \# Xorg and USB services, added by freebsd-setup
  echo hald_enable=\"YES\"
  echo dbus_enable=\"YES\"
  echo
} >> /etc/rc.conf

echo Desktop settings...
touch /etc/sysctl.conf
{
  echo
  echo \# Enhanced desktop settings, some required by Chromium, added by freebsd-setup
  echo \# Thanks to https://cooltrainer.org/a-freebsd-desktop-howto/
  echo kern.ipc.shmmax=67108864
  echo kern.ipc.shmall=32768
  echo kern.sched.preempt_thresh=224
  echo kern.maxfiles=200000
  echo kern.ipc.shm_allow_removed=1
  echo vfs.usermount=1
  echo
} >> /etc/sysctl.conf

cp conf/polkit/10-xfce4.rules /usr/local/etc/polkit-1/rules.d/


