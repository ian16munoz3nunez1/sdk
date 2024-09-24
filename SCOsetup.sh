#!/bin/bash

if [ $EUID != 0 ]
then
    echo -e "\e[5m\e[1;41mMust run as root\e[0m"
    exit 1
fi

# apt-get update
# apt-get upgrade
# apt install openjdk-8-jdk

apt install $1/toshibaposs-gcc
apt install $1/toshibaposs-gcc48_12.1.3-38_amd64.deb

apt install $1/toshiba-java
apt install $1/toshiba-javapos_1.14.13-22_amd64.deb

apt install $1/javax-usb
apt install $1/javax-usb_1.0.2-1_amd64.deb

apt install $1/javax-usb-ri
apt install $1/javax-usb-ri_1.0.2-1_amd64.deb

apt install $1/javax-usb-ri-linux
apt install $1/javax-usb-ri-linux_1.0.3-2_amd64.deb

