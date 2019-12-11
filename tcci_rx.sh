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
echo '++++++++++++++++++++++++++++++++++++Receiver STARTING+++++++++++++++++++++++++++++++++++++++++++++++'

# The packet transmission source code is modified based on the code from (c)2015 befinitiv # which in turn is based on packetspammer by Andy Green # Licensed under GPL2
sudo ./rx -b 1 -r 0 -f 1024 $itfc | /usr/bin/gst-launch-1.0 fdsrc ! filesink location=/PATH/TO/YOUR/tcci_concurrent_transmission_downloaded_files/fromusrp_dongle_10000_rcv.dat


