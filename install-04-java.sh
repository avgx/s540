#!/bin/bash

. ~/.config/user-dirs.dirs

DOWNLOADS="$XDG_DOWNLOAD_DIR/downloads"
mkdir -p $DOWNLOADS
mkdir -p ~/local

#install, and configure the system to use the JAVA JDK
(
cd $DOWNLOADS
[ -e jdk-7u51-linux-x64.tar.gz ] || wget --no-cookies --timeout=30 --tries=0 --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz
tar xzvf ./jdk-7u51-linux-x64.tar.gz
sudo mv ./jdk1.7.0_51 /usr/lib/jvm/

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_51/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.7.0_51/bin/javac 1
sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.7.0_51/bin/javaws 1
sudo update-alternatives --config java
sudo update-alternatives --config javaws
)

cat >>~/.profile  <<EOF

export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_51"
export PATH="\$JAVA_HOME/bin:\$PATH"
EOF


source ~/.profile 
echo "${JAVA_HOME}"
echo "${PATH}"
java -version

#install maven
(
cd $DOWNLOADS
[ -e apache-maven-3.1.1-bin.tar.gz ] || wget --timeout=30 --tries=0 http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
tar xzvf ./apache-maven-3.1.1-bin.tar.gz
mv ./apache-maven-3.1.1 ~/local/
)

cat >>~/.profile  <<EOF

export M2_HOME="\$HOME/local/apache-maven-3.1.1/"
export PATH="\$M2_HOME/bin:\$PATH"
EOF


source ~/.profile 
echo "${M2_HOME}"
echo "${PATH}"
mvn --help

sudo apt-get install ant
ant --help

# dex2jar-0.0.9.15
(
cd $DOWNLOADS
[ -e dex2jar-0.0.9.15.zip ] || wget http://dex2jar.googlecode.com/files/dex2jar-0.0.9.15.zip
unzip ./dex2jar-0.0.9.15.zip 
mv ./dex2jar-0.0.9.15 ~/local/
)

cat >>~/.profile  <<EOF

export DEX2JAR_HOME="\$HOME/local/dex2jar-0.0.9.15"
export PATH="\$DEX2JAR_HOME:\$PATH"
EOF

source ~/.profile 
echo "${DEX2JAR_HOME}"
echo "${PATH}"
which d2j-dex2jar.sh

# jd-gui
(
cd $DOWNLOADS
[ -e jd-gui-0.3.5.linux.i686.tar.gz ] || wget http://jd.benow.ca/jd-gui/downloads/jd-gui-0.3.5.linux.i686.tar.gz
mkdir -p jd-gui-0.3.5.linux.i686
(
cd ./jd-gui-0.3.5.linux.i686
tar xzvf ../jd-gui-0.3.5.linux.i686.tar.gz
)
mv ./jd-gui-0.3.5.linux.i686 ~/local/
)

sudo apt-get install libgtk-x11
sudo apt-get install libgtk2.0-0:i386
sudo apt-get install libcanberra-gtk-module:i386

sudo apt-get install ia32-libs libsm6 libsm6:i386
sudo apt-get install libsm6 libsm6:i386

cat >>~/.profile  <<EOF

export JDGUI_HOME="\$HOME/local/jd-gui-0.3.5.linux.i686"
export PATH="\$JDGUI_HOME:\$PATH"
EOF

source ~/.profile 
echo "${JDGUI_HOME}"
echo "${PATH}"
which jd-gui

