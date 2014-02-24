#!/bin/bash

sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list'

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt-get update

sudo apt-get install virtualbox-4.3

wget http://dlc.sun.com.edgesuite.net/virtualbox/4.3.6/Oracle_VM_VirtualBox_Extension_Pack-4.3.6-91406.vbox-extpack