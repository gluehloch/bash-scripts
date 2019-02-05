#!/bin/bash
INSTALLDIR=$(pwd)
echo "Install directory $INSTALLDIR"
mkdir "$INSTALLDIR/download"
mkdir "$INSTALLDIR/devtools"
mkdir "$INSTALLDIR/devtools/java"

JDK11="openjdk-11.0.2_linux-x64_bin.tar.gz"

if [ -e "$INSTALLDIR/download/$JDK11" ]
then
    echo "JDK 11 is already downloaded"
else
    wget -P "$INSTALLDIR/download" https://download.java.net/java/GA/jdk11/9/GPL/$JDK11
fi
exit 0;
