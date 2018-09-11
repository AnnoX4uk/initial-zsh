#!/bin/bash

packages="rsync zsh screen mc net-tools tcpdump traceroute"
#check system
if cat /etc/*release | grep ^NAME | grep CentOS; then
    echo "==============================================="
    echo "Installing $packages on CentOS"
    echo "==============================================="
    yum install -y $packages
 elif cat /etc/*release | grep ^NAME | grep Red; then
    echo "==============================================="
    echo "Installing packages $packages on RedHat"
    echo "==============================================="
    yum install -y $packages
 elif cat /etc/*release | grep ^NAME | grep Fedora; then
    echo "================================================"
    echo "Installing packages $packages on Fedorea"
    echo "================================================"
    yum install -y $packages
 elif cat /etc/*release | grep ^NAME | grep Ubuntu; then
    echo "==============================================="
    echo "Installing packages $packages on Ubuntu"
    echo "==============================================="
    apt-get install -y $packages
 elif cat /etc/*release | grep ^NAME | grep Debian ; then
    echo "==============================================="
    echo "Installing packages $packages on Debian"
    echo "==============================================="
    apt-get install -y --force-yes $packages
 elif cat /etc/*release | grep ^NAME | grep Mint ; then
    echo "============================================="
    echo "Installing packages $packages on Mint"
    echo "============================================="
    apt-get install -y $packages
 elif cat /etc/*release | grep ^NAME | grep Knoppix ; then
    echo "================================================="
    echo "Installing packages $packages on Kanoppix"
    echo "================================================="
    apt-get install -y $packages
 else
    echo "OS NOT DETECTED, couldn't install package $packages"
    exit 1;
 fi

zsh_path=which zsh
#copy shell settings to current system
cp -Rvf ./user_config/ $HOME
cp -Rvf ./root_config/ /root/
usermod -s $zsh_path $USER
exit 0