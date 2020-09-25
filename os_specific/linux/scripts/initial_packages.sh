#! /bin/bash

cd ../../../

# Git
sudo apt-get install git

# Python3
sudo apt-get install python3-venv # To create virtualenvs

# Vim
sudo apt-get install vim

# Build Essential (needed to use 'make' command)
sudo apt-get install build-essential # Need for 'make' command

#Latex
package_specific/Latex/scripts/installation.sh

# X11 package, needed by dwm
#sudo apt-get install libx11-dev
#sudo apt-get install libxft-dev
#sudo apt-get install libxinerama-dev

# XFCE
#sudo apt-get install gvfs-backends
