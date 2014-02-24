#!/bin/bash

. ~/.config/user-dirs.dirs

DOWNLOADS="$XDG_DOWNLOAD_DIR/downloads"
mkdir -p $DOWNLOADS

(
cd $DOWNLOADS

[ -e genymotion-idea-plugin-20140130.jar ] || wget http://plugins.genymotion.com/plugins/idea/1.0.2/genymotion-idea-plugin-20140130.jar
[ -e genymotion-2.1.1_x64.bin ] || wget --timeout=10 --tries=0 http://files2.genymotion.com/genymotion/genymotion-2.1.1/genymotion-2.1.1_x6
)
