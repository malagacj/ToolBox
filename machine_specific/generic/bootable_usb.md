# Bootable USB

## Prerequisites
1. OS image (iso, zip, etc...)
1. USB Pendrive

## Create Bootable USB
### Verify downloaded file
```bash
sha256sum <FILE>
```
FILE: can be either the image or the zip file downloaded

### Find USB path
Use the following command to list all connected devices.
```bash
lsblk
```

Take note of the connected devices

Connect the MicroSD Card to the computer and run the same command again
Write down name of MicroSD Card (I think that it cannot be sda or sr0)
```bash
lsblk
```

### Install OS on USB Pendrive
Let's assume that the MicroSD Card is CARD_NAME (i.e. 'mmcblk0')

If using .img file, run in Terminal:
```bash
dd bs=4M if=<IMAGE_FILE> of=/dev/<CARD_NAME> conv=fsync
i.e:
sudo dd bs=4M if=2018-06-27-raspbian-stretch-lite.img of=/dev/mmcblk0 status=progress conv=fsync

```

If .img is within a ZipFile, run in Terminal:
```bash
unzip -p <ZIP_FILE> | sudo dd of=/dev/<CARD_NAME> bs=4M conv=fsync
i.e:
unzip -p 2018-06-27-raspbian-stretch-lite.zip | sudo dd of=/dev/mmcblk0 bs=4M status=progress conv=fsync
```

Congratulations, the OS has been succesfully installed on the MicroSD card!


## References
* Ref_01: https://www.raspberrypi.org/documentation/installation/installing-images/linux.md
