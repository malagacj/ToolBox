#!/bin/bash

# Getting Slack and Prerequisites
wget http://ftp.us.debian.org/debian/pool/main/libi/libindicator/libindicator3-7_0.5.0-4_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/liba/libappindicator/libappindicator3-1_0.4.92-7_amd64.deb
wget https://downloads.slack-edge.com/releases/linux/4.27.156/prod/x64/slack-desktop-4.27.156-amd64.deb

# Installing Slack and Prerequisites
sudo apt install ./libindicator3-7_0.5.0-4_amd64.deb
sudo apt install ./libappindicator3-1_0.4.92-7_amd64.deb
sudo apt install ./slack-desktop-4.27.156-amd64.deb
