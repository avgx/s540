#!/bin/bash

sudo cat >>/etc/udev/rules.d/51-android.rules <<EOF
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e42", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e40", MODE="0666"
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e41", MODE="0666"
EOF

sudo /etc/init.d/udev restart