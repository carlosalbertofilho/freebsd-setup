#!/bin/sh

set -e

echo
echo Make index of the Ports
echo

cd /usr/ports
make index

echo
echo Install portmaster and psearch
echo

cd ports-mgmt/portmaster && make install

cd /usr/ports
cd ports-mgmt/psearch && make install

echo
echo Install network drivers
echo

portmaster \
  net/realtek-re-kmod   \
  comms/iwmbt-firmware  \
  net/bwi-firmware-kmod \
  net/bwn-firmware-kmod \
  audio/virtual_oss

cp conf/boot/mac.pcx /boot
{
echo \# Boot menu dalay
echo autoboot_delay=\"5\"
echo
echo \# these values need to be bumped up a bit for desktop usage
echo kern.maxproc=\"100000\"
echo kern.ipc.shmseg=\"1024\"
echo kern.ipc.shmmni=\"1024\"
echo
echo \# Splash scree boot
echo boot_mute=\"YES\"
echo splash_pcx_load=\"YES\"
echo bitmap_load=\"YES\"
echo bitmap_name=\"/boot/mac.pcx\"
echo
echo \# security
echo security.bsd.allow_destructive_dtrace=\"0\"
echo kern.geom.label.disk_ident.enable=\"0\"
echo kern.geom.label.gptid.enable=\"0\"
echo cryptodev_load=\"YES\"
echo
echo \# Added Network and Wifi
echo \# Realtek Ethernet
echo if_rtwn_pci_load=\"YES\"
echo if_re_load=\"YES\"
echo if_re_name=\"/boot/modules/if_re.ko\"
echo hw.re.max_rx_mbuf_sz=\"2048\"
echo \# enable hardware accelerated AES can speed up TLS
echo aesni_load=\"YES\"
echo
echo \# Load the H-TCP algorithm. It has a more aggressive ramp-up to max
echo \# bandwidth, and is optimized for high-speed, high-latency connections.
echo cc_htcp_load=\"YES\"
echo
echo \# enable CPU firmware updates
echo cpuctl_load=\"YES\"
echo
echo \# enable CPU temperature monitoring
echo coretemp_load=\"YES\"
echo
echo \# Sound kernel load
echo cuse_load=\"YES\"
echo snd_hda_load=\"YES\"
} >> /boot/loader.conf
