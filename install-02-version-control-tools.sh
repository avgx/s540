#!/bin/bash

sudo apt-get install mercurial git subversion meld

#console git colorizer
sudo add-apt-repository ppa:aguignard/ppa
sudo add-apt-repository ppa:mercurial-ppa/releases
sudo add-apt-repository ppa:tortoisehg-ppa/releases
sudo add-apt-repository ppa:rabbitvcs/ppa
sudo apt-get update

sudo apt-get install tig

sudo apt-get install tortoisehg tortoisehg-nautilus
sudo apt-get install tortoisesvn tortoisesvn-nautilus

sudo apt-get install rabbitvcs-nautilus3
sudo apt-get install rabbitvcs-gedit

#copy ./desktop/nautilus.desktop to ~/Desktop