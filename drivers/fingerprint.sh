#!/bin/bash

#http://forums.lenovo.com/t5/Linux-Discussion/Ubuntu-13-10-on-a-T440-Wifi-Sound-Fingerprint-reader-and/td-p/1346853

git clone https://github.com/maffmeier/fprint_vfs5011.git
cd fprint_vfs5011
sudo apt-get install libusb-1.0-0-dev libnss3-dev libglib2.0-dev libgdk-pixbuf2.0-dev
./configure
make
#sudo make install