# HP Phoenix h9-13505

The purpose of this guide is to provide specific guidelines for installing Debian 11 Bullseye on an HP Phoenix h9-13505 machine

## Prerequisites

* HP Phoenix h9-13505 machine
* USB Drive with Debian Live [inside](../../generic/bootable_usb.md)

## Installation
The installation details are specified [here](./debian_live.md).

## Post-installation
* Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-debian) and run the following [playbook](./ansible/playbook.yaml)
* [Non-free packages (rt2860.bin)](./non-free.md)

## OS images
* Debian [Bullseye](https://www.debian.org/download) or
* Debian Live [Bullseye](https://www.debian.org/CD/live/). Use this if the other one fails
