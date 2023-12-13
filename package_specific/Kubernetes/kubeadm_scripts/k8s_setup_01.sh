#! /bin/bash

NODE_NAME=$1

sudo hostnamectl set-hostname $NODE_NAME
sudo reboot
