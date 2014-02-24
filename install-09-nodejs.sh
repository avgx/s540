#!/bin/bash

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

nodejs -v 
#outputs 0.10.25
npm -v 
#outputs 1.3.24

echo "prefix = ~/.node" >> ~/.npmrc
npm config set prefix ~/.node
cat >>~/.profile <<EOF

export PATH="\$HOME/.node/bin:\$PATH"

EOF

source ~/.profile

ln -s ~/.node/lib/node_modules ~/.node_modules

npm install octonode -g