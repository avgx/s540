#!/bin/bash

#http://www.linuxrussia.com/2013/04/skype-ubuntu-1210-1304-1204.html

sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

sudo apt-get update

sudo apt-get install skype && sudo apt-get -f install

