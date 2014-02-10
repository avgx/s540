#!/bin/bash

#sudo apt-get install juffed

juffedConf=zzz_usr_lib64_juffed.conf
cat >./$juffedConf <<EOF 
/usr/lib64
EOF
sudo mv ./$juffedConf /etc/ld.so.conf.d/
sudo ldconfig
