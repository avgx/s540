#!/bin/bash

sudo apt-get install linux-headers-generic build-essential git
git clone http://github.com/lwfinger/rtl8723be
cd rtl8723be
make
#sudo make install
#sudo modprobe rtl8723be
