#! /bin/bash

echo 'Installing Postgresql'
sudo apt-get install postgresql
echo ''

echo 'Setting up superusers: ' $USER
sudo -u postgres createuser -s $USER
echo ''
