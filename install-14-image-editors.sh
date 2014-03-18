#!/bin/bash

#for those who don't like mtpaint

sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo apt-get update
sudo apt-get install pinta

#for making screenshots add this to ~/.config/openbox/lubuntu-rc.xml
# and run "openbox --reconfigure"
#    <keybind key="W-Print">
#      <action name="Execute">
#        <command>scrot -u -b -d 0 -q 100 ~/Изображения/%b%d::%H%M%S.png</command>
#      </action>
#    </keybind>
