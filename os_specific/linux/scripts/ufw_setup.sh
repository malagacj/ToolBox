#! /bin/bash

# UFW
sudo apt-get install ufw

# Set UFW defaults
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH connections and HTTPS
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

# Enabling UFW
sudo ufw enable

# Summary
sudo ufw status verbose


# Source:
# 1: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-20-04
