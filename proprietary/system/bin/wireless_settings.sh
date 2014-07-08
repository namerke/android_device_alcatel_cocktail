#!/tmp/sh
#
# Cocktail BT/wifi mac address loader 
#
# Original author: Bagyusz
#   
# 2014 01 20
#####################################

export PATH=/tmp

mount -o remount, rw rootfs /

cd /
hexdump -C /dev/block/mmcblk0p13 | head -n4 | tail -n1 > /tmp/hex
# mixed mac address
cat /tmp/hex | tail -c61 | head -c37 > /tmp/BT_WIFI_mix
cat /tmp/BT_WIFI_mix | sed 's/ /:/g' > /tmp/add_dots
# duplicated double dot fix
cat /tmp/add_dots | sed 's/::/:/' > /tmp/dot_fix

# WIFI mac address backward read
cat /tmp/dot_fix | tail -c2 > /tmp/reverse
cat /tmp/dot_fix | tail -c6 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c9 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c12 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c15 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c18 | head -c3 >> /tmp/reverse
# BT mac address backward read
cat /tmp/dot_fix | tail -c21 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c24 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c27 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c30 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c33 | head -c3 >> /tmp/reverse
cat /tmp/dot_fix | tail -c36 | head -c3 >> /tmp/reverse

# Real BT mac address
cat /tmp/reverse | tail -c17 > /system/etc/bluetooth/bdaddr.txt

# Make "macaddr=" word
echo 'macaddr=' > /tmp/macaddr_word
cat /tmp/macaddr_word | head -c8 >> /tmp/WIFI_mac
# Real WIFI mac address
cat /tmp/reverse | head -c17 >> /tmp/WIFI_mac

# set WIFI mac
cat /tmp/WIFI_mac >> /system/etc/wifi/bcmdhd.cal
# set BT mac
setprop ro.bt.bdaddr_path /system/etc/bluetooth/bdaddr.txt

# ipconfig_fix
touch /data/misc/wifi/ipconfig.txt
chmod 0777 /data/misc/wifi/ipconfig.txt

# dnsmasq "FAILED to start up" fix
touch /data/misc/dhcp/dnsmasq.leases
chmod 0777 /data/misc/dhcp/dnsmasq.leases

# remove temp folder
rm -r /tmp
