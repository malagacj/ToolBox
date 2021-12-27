# Non-free
This guide will show you how to add non-free debian resources and how to install rt2860.bin

## Sources List

Create /etc/apt/sources.list.d/non-free.list and add the following lines:
```bash
deb http://deb.debian.org/debian/ buster main non-free
deb-src http://deb.debian.org/debian/ buster main non-free
```

## Installation
```bash
sudo apt-get update; sudo apt-get upgrade
sudo apt-get install firmware-misc-nonfree
```
