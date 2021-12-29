# Non-free
This guide will show you how to add non-free debian resources and how to install rt2860.bin

## Sources List

Create /etc/apt/sources.list.d/non-free.list and add the following lines:
```bash
deb http://deb.debian.org/debian/ bullseye non-free
deb-src http://deb.debian.org/debian/ bullseye non-free
```

## Installation
```bash
sudo apt update
sudo apt install firmware-misc-nonfree
```
