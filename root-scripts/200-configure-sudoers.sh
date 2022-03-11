#!/bin/sh

set -e

echo "%wheel ALL=(ALL) NOPASSWD: /bin/date" > /usr/local/etc/sudoers.d/date
echo "%wheel ALL=(ALL) NOPASSWD: /sbin/reboot" > /usr/local/etc/sudoers.d/reboot
echo "%wheel ALL=(ALL) NOPASSWD: /usr/sbin/acpiconf" > /usr/local/etc/sudoers.d/acpiconf
echo "%wheel ALL=(ALL) NOPASSWD: /usr/sbin/halt" > /usr/local/etc/sudoers.d/halt
echo "%wheel ALL=(ALL) NOPASSWD: /usr/sbin/service" > /usr/local/etc/sudoers.d/service

chown root:wheel /usr/local/etc/sudoers.d/*
chmod 0440 /usr/local/etc/sudoers.d/*

