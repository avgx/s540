#!/bin/bash

. ~/.config/user-dirs.dirs

DOWNLOADS="$XDG_DOWNLOAD_DIR/downloads"
PLUGINS="$DOWNLOADS/android-studio-plugins"
mkdir -p $DOWNLOADS
mkdir -p $PLUGINS
mkdir -p ~/local

# http://developer.android.com/sdk/installing/studio.html
# http://www.cnx-software.com/2013/05/16/installing-android-studio-ide-in-ubuntu-hello-world-application/

(
cd $DOWNLOADS
[ -e android-studio-bundle-133.970939-linux.tgz ] || wget --timeout=30 --tries=0 http://dl.google.com/android/studio/install/0.4.2/android-studio-bundle-133.970939-linux.tgz
tar xzvf ./android-studio-bundle-133.970939-linux.tgz
mv ./android-studio-bundle-133.970939-linux/* ~/local/android-studio/

)

cat >>~/.profile  <<EOF

export ANDROID_HOME="\$HOME/local/android-studio/sdk"
export PATH="\$ANDROID_HOME/tools:\$ANDROID_HOME/platform_tools:\$PATH"
EOF

source ~/.profile 
echo "${ANDROID_HOME}"
echo "${PATH}"
which android-studio.sh



(
cd $DOWNLOADS
[ -e android-ndk-r9c-linux-x86_64.tar.bz2 ] || wget --timeout=30 --tries=0 http://dl.google.com/android/ndk/android-ndk-r9c-linux-x86_64.tar.bz2
tar xjvf ./android-ndk-r9c-linux-x86_64.tar.bz2
mv ./android-ndk-r9c-linux-x86_64/* ~/local/android-ndk-r9c/
)

cat >>~/.profile  <<EOF

export ANDROID_NDK="\$HOME/local/android-ndk-r9c"
export NDK_BASE="\$ANDROID_NDK"
EOF

source ~/.profile 
echo "${ANDROID_NDK}"
echo "${PATH}"


sudo apt-get install yasm
sudo apt-get install automake
sudo apt-get install libtool

sudo apt-get install android-tools-adb
