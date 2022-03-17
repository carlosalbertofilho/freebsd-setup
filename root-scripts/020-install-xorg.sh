#!/bin/sh

set -e

# Generic xorg utilities.
portmaster \
    graphics/scrot \
    x11-wm/stumpwm \
    net/unison \
    graphics/drm-kmod \
    x11-drivers/xf86-video-amdgpu \
    x11-drivers/xf86-video-mga \
    x11-drivers/xf86-input-keyboard \
    x11-drivers/xf86-input-mouse \
    graphics/mesa-gallium-va \
    graphics/mesa-gallium-vdpau \
    graphics/mesa-gallium-xa \
    x11/xclip \
    audio/xmixer \
    x11/xorg \
    x11/xscreensaver \
    x11/xterm \
    x11/alacritty

# XFCE4 desktop for pairing, etc.
portmaster \
    x11-wm/xfce4 \
    x11-themes/adwaita-icon-theme\
    misc/gnome-icon-theme \
    misc/gnome-icon-theme-extras \
    x11-themes/gnome-icon-theme-symbolic \
    misc/hicolor-icon-theme \
    x11-themes/lxde-icon-theme \
    x11-themes/mate-icon-theme \
    x11-themes/mate-icon-theme-faenza \
    archivers/thunar-archive-plugin \
    audio/thunar-media-tags-plugin \
    devel/thunar-vcs-plugin \
    misc/xfce4-appfinder \
    sysutils/xfce4-battery-plugin \
    sysutils/xfce4-bsdcpufreq-plugin \
    math/xfce4-calculator-plugin \
    x11/xfce4-clipman-plugin \
    sysutils/xfce4-cpugraph-plugin \
    x11/xfce4-dashboard \
    x11-clocks/xfce4-datetime-plugin \
    devel/xfce4-dev-tools \
    textproc/xfce4-dict-plugin \
    sysutils/xfce4-diskperf-plugin \
    sysutils/xfce4-fsguard-plugin \
    sysutils/xfce4-genmon-plugin \
    mail/xfce4-mailwatch-plugin \
    sysutils/xfce4-mount-plugin \
    sysutils/xfce4-mount-plugin \
    audio/xfce4-mpc-plugin \
    sysutils/xfce4-netload-plugin \
    deskutils/xfce4-notes-plugin \
    deskutils/xfce4-notifyd \
    x11-wm/xfce4-panel \
    x11-wm/xfce4-panel-profiles \
    sysutils/xfce4-power-manager \
    audio/xfce4-pulseaudio-plugin \
    x11/xfce4-screenshooter-plugin \
    sysutils/xfce4-settings \
    www/xfce4-smartbookmark-plugin \
    sysutils/xfce4-systemload-plugin \
    x11/xfce4-taskmanager \
    x11-clocks/xfce4-time-out-plugin \
    x11-clocks/xfce4-timer-plugin \
    deskutils/xfce4-tumbler \
    x11/xfce4-verve-plugin \
    deskutils/xfce4-volumed-pulse \
    sysutils/xfce4-wavelan-plugin \
    misc/xfce4-weather-plugin \
    x11/xfce4-whiskermenu-plugin \
    misc/xfce4-wm-themes \
    deskutils/xfce4-xkb-plugin

cp -fr conf/etc/* /etc

touch /etc/rc.conf
{
  echo \# Splash
  echo rc_startmsgs=\"NO\"
  echo \# dont hang the boot process while waiting on DHCP
  echo background_dhclient=\"YES\"
  echo \# disable kernel crash dumps
  echo dumpdev=\"NO\"
  echo
  echo \# Init Flags
  echo clear_tmp_enable=\"YES\"
  echo syslogd_flags=\"-ss\"
  echo sendmail_enable=\"NONE\"
  echo hostname=\"gaia.local\"
  echo keymap=\"br.kbd\"
  echo sshd_enable=\"YES\"
  echo
  echo \# Xorg and USB services
  echo hald_enable=\"YES\"
  echo dbus_enable=\"YES\"
  echo devd_enable=\"YES\"
  echo devfs_system_ruleset=\"system\"
  echo kld_list=\"fusefs amdgpu cuse vmm\"
  echo fusefs_enable=\"YES\"
  echo
  echo \# Config Ethernet
  echo ifconfig_re0=\"DHCP\"
  echo \# Intel AX200
  echo kld_list+=\"/boot/kernel/if_iwlwifi.ko\"
  echo wlans_iwlwifi0=\"wlan0\"
  echo ifconfig_wlan0=\"WPA DHCP\"
  echo create_args_wlan0=\"country BR regdomain FCC\"
  echo
  echo \# Firewall
  echo firewall_enable=\"YES\"
  echo firewall_type=\"client\"
  echo firewall_client_net=\"192.168.0.0/24\"
  echo firewall_script=\"/etc/ipfw.rules\"
  echo
  echo \# NFS config client
  echo nfs_client_enable=\"YES\"
  echo rpc_statd_enable=\"YES\"
  echo rpc_lockd_enable=\"YES\"
  echo autofs_enable=\"YES\"
  echo
  echo \# Audio Devices
  echo sndiod_enable="YES"
} >> /etc/rc.conf

echo Desktop settings...
touch /etc/sysctl.conf
{
  echo
  echo \# Enhanced desktop settings, some required by Chromium
  echo \# Thanks to https://cooltrainer.org/a-freebsd-desktop-howto/
  echo kern.ipc.shmmax=67108864
  echo kern.ipc.shmall=32768
  echo kern.sched.preempt_thresh=224
  echo kern.maxfiles=200000
  echo kern.ipc.shm_allow_removed=1
  echo vfs.usermount=1
  echo
  echo \# ashift optimization
  echo vfs.zfs.min_auto_ashift=12
  echo
  echo \# random PID
  echo kern.randompid=1
  echo
  echo \# Firewall verbose limit
  echo net.inet.ip.fw.verbose_limit=5
  echo
  echo \# Config NAT
  echo net.inet.ip.forwarding=1
  echo
  echo \# Config NFS
  echo vfs.nfs.enable_uidtostring=1
  echo vfs.nfsd.enable_stringtouid=1
  echo
  echo \# # disable annoying system beep
  echo hw.syscons.bell=0
  echo kern.vt.enable_bell=0
  echo
  echo \# Sound config
  echo hw.snd.vpc_0db=45
  echo hw.snd.vpc_mixer_bypass=1
  echo hw.snd.default_unit=3
  echo hw.snd.latency=2
  echo hw.snd.feeder_rate_quality=1
  echo hw.snd.maxautovchans=16
  echo
  echo \# some tweaks to boost network performance over long, fat pipes
  echo  net.inet.tcp.cc.algorithm=htcp
  echo net.inet.tcp.cc.htcp.adaptive_backoff=1
  echo net.inet.tcp.cc.htcp.rtt_scaling=1
  echo net.inet.tcp.rfc6675_pipe=1
  echo net.inet.tcp.syncookies=0
  echo net.inet.tcp.nolocaltimewait=1
  echo kern.ipc.soacceptqueue=1024
  echo kern.ipc.maxsockbuf=8388608
  echo kern.ipc.maxsockbuf=2097152
  echo net.inet.tcp.sendspace=262144
  echo net.inet.tcp.recvspace=262144
  echo net.inet.tcp.sendbuf_max=16777216
  echo net.inet.tcp.recvbuf_max=16777216
  echo net.inet.tcp.sendbuf_inc=32768
  echo net.inet.tcp.recvbuf_inc=65536
  echo net.local.stream.sendspace=16384
  echo net.local.stream.recvspace=16384
  echo net.inet.raw.maxdgram=16384
  echo net.inet.raw.recvspace=16384
  echo net.inet.tcp.abc_l_var=44
  echo net.inet.tcp.initcwnd_segments=44
  echo net.inet.tcp.mssdflt=1448
  echo net.inet.tcp.minmss=524
  echo net.inet.ip.intr_queue_maxlen=2048
  echo net.route.netisr_maxqlen=2048
} >> /etc/sysctl.conf

cp conf/polkit/10-xfce4.rules /usr/local/etc/polkit-1/rules.d/


