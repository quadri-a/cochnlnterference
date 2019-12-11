# TCCI: Taming Co-Channel Interference 

## Enabling Concurrent Transmission using Commercial Wireless USB Adapters

In the TCCI scheme based network, wireless stations can transmit concurrently.

- For the stations, we use [Alfa AWUS036NHA Wireless USB Adapters](http://www.amazon.com/dp/B004Y6MIXS?tag=modwiffir-20), which are built using Qualcomm Atheros AR9271 chipset and support IEEE 802.11b/g/n.
- We have modified its open-source firmware (modwifi-ath9k-htc) to disable carrier sense, RTS/CTS, ACK, and set SIFS/AIFS to its minimum. 
- Linux 802.11 ath9k driver were also modified \cite{wslgithub} (in Ubuntu) to implement concurrent transmission.

Source codes and tools related to the WiFi dongles (i.e stations) are hosted here only not the USRp based Access points (AP).

### Step 1: Installing atheros driver tools

Please visit [here](https://github.com/vanhoefm/modwifi/blob/master/README.md) to learn details about the installation procedure and source codes. If you find their work useful, please cite the project. 

### Step 2: Source codes for concurrent transmission - disabling CSMA, ACK, setting SIFS/AIFS/Slotime

- Download or clone this repository
#### Transmitter
- Please open tcci_tx.sh shell script and make sure to update the path to where you downloaded the files.
- Run tcci_tx.sh 
  - User will be prompted to enter the wireless interface and PHY. 
  - tcci_tx will print out the available WiFi hardware (phy#) and interface (wlan0).
  - It will also configure the WiFi dongle to transmit in monitor mode. 
  - Proper installation of the modwifi-ath9k-htc should allow the rest of the source code to disable CSMA/ACK and set the IFS duration.
  - Finally, it will initiate packet transmission. 
  - The source codes for packet transmission are modified based on the this [project](https://befinitiv.wordpress.com/wifibroadcast-analog-like-transmission-of-live-video-data/wifibroadcast-fpv-manual-setup/). To learn more or cite, please visit the webpage.
 
 #### Receiver
 - Please open tcci_rx.sh shell script and make sure to update the path to where you downloaded the files.
 - Run tcci_rx.sh 
    - tcci_rx will perform similar operation as tcci_tx except for the last two steps of transmitter,
    
  
  
