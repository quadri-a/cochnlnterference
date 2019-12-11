#!/bin/sh

sudo rfkill block all
sudo rfkill unblock wifi

# WiFi hardware/device information
sudo iw dev

read -p " enter the interface name - " itfc
read -p " enter the PHY name - " PHY

sudo ifconfig $itfc down

# Set monitor mode
sudo iw dev $itfc set monitor otherbss fcsfail
sudo ifconfig $itfc up

# Set channel
sudo iw $itfc set channel 13
# Print out wireless config info
sudo iwconfig

# Use if there is permission problem to mount 
#sudo chmod a+rx /sys/kernel/debug
mount -t debugfs none /sys/kernel/debug/

# Proper installation of modwifi-ath9k-htc should show the registers directory
cd /sys/kernel/debug/ieee80211/$PHY/ath9k_htc/registers/;

#Prints out configured settings and disables CSMA, sets SIFS/Slotime
echo $PHY;
echo 1 > force_channel_idle;
echo 1 > ignore_virt_cs;
more force_channel_idle;
more ignore_virt_cs;
cd ..
echo 0x00000001 > time_slottime;
echo 0x00000002 > time_sifs;

more time_slottime;
more time_sifs;

echo '+++++++++++++++++++++++++++++++CSMA/CA disabled and frame intervals reduced +++++++++++++++++++++++++++++++++++++++++++++++++'

# Update PATH 
cd ~/PATH/TO/YOUR/tcci_concurrent_transmission_downloaded_files

echo '+++++++++++++++++++++++++++++++++++++++TRANSMITTER STARTING++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'

# The packet transmission source code is modified based on the code from (c)2015 befinitiv # which in turn is based on packetspammer by Andy Green # Licensed under GPL2

sudo /usr/bin/gst-launch-1.0 filesrc location="/PATH/TO/YOUR/tcci_concurrent_transmission_downloaded_files/dongle_1_10000.txt" ! fdsink | sudo ./tx $itfc -x 40000 #-f 100 #-r 3 	

