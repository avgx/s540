#!/bin/bash

sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `sudo apt-get update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs`