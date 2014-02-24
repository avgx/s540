#!/bin/bash

. ~/.config/user-dirs.dirs

DOWNLOADS="$XDG_DOWNLOAD_DIR/downloads"
PLUGINS="$DOWNLOADS/android-studio-plugins"
mkdir -p $DOWNLOADS
mkdir -p $PLUGINS

(
cd $PLUGINS

[ -e android-butterknife-zelezny.jar ] || wget http://plugins.jetbrains.com/files/7369/14963/android-butterknife-zelezny.jar
[ -e intellij-android-codegenerator.zip ] || wget https://raw2.github.com/kurganec/intellij-android-codegenerator/master/intellij-android-codegenerator.zip
[ -e dagger-intellij-plugin.jar ] || wget https://raw.github.com/square/dagger-intellij-plugin/master/dagger-intellij-plugin.jar
[ -e otto-intellij-plugin.jar ] || wget https://raw.github.com/square/otto-intellij-plugin/master/otto-intellij-plugin.jar
[ -e jd-intellij-0.4.1.zip ] || wget http://plugins.jetbrains.com/files/7100/14315/jd-intellij-0.4.1.zip
[ -e GradleDependencySupport.jar ] || wget https://github.com/ligi/GradleDependenciesHelperPlugin/releases/download/v1.4/GradleDependencySupport.jar
[ -e AndroidHoloColors.jar ] || wget https://raw2.github.com/jeromevdl/android-holo-colors-idea-plugin/master/AndroidHoloColors.jar

)
