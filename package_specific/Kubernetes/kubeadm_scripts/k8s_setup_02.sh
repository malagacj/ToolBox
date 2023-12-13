#! /bin/bash

HOSTNAME=$(hostname)

# Set Hosts
sudo bash -c 'echo "" >> /etc/hosts'
sudo bash -c 'echo "192.168.1.163	k8s-master" >> /etc/hosts'
sudo bash -c 'echo "192.168.1.164	k8s-node01" >> /etc/hosts'
sudo bash -c 'echo "192.168.1.165	k8s-node02" >> /etc/hosts'

# Disable Swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Install and setup UFW
sudo apt install ufw -y

# Set UFW defaults
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH connections and HTTPS
sudo ufw allow ssh # 22

if [[ "$HOSTNAME" == *"master"* ]]; then
  echo 'UFW Setup for Master'
  sudo ufw allow 6443/tcp
  sudo ufw allow 2379/tcp
  sudo ufw allow 2380/tcp
  sudo ufw allow 10250/tcp
  sudo ufw allow 10251/tcp
  sudo ufw allow 10252/tcp
  sudo ufw allow 10255/tcp
else
  echo 'UFW Setup for Node'
  sudo ufw allow 10250/tcp
  sudo ufw allow 30000:32767/tcp
fi

sudo ufw enable
sudo ufw reload
