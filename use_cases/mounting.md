# Mounting

## Prerequisites
Install "cifs-utils" package for your distro
Check [Mounting Windows Share] for more information.

### Debian/Ubuntu
```bash
sudo apt install cifs-utils
```

### CentOS/Fedora
```bash
sudo dnf install cifs-utils
```


## Mounting Shares manually

Use the following command to get the password prompted when mounting
```bash
sudo mount -t cifs '//WIN_SHARE_IP_DNS/<share_name>' <path_to_folder> -o user,ro,noauto,username=<username>
```

Or you can include the password for direct mounting
```bash
sudo mount -t cifs '//WIN_SHARE_IP_DNS/<share_name>' <path_to_folder> -o user,ro,noauto,username=<username>,password=<password>
```

## Mounting Shares on Boot
Watch [LearnLinuxTV's fstab] video for learning on normal block storage mount with fstab

Watch [GeekHead fstab with cifs]'s video for learning on normal cifs Share storage mount with fstab


[Mounting Windows Share]: https://linuxize.com/post/how-to-mount-cifs-windows-share-on-linux/
[LearnLinuxTV]: https://www.youtube.com/watch?v=A7xH74o6kY0
[GeekHead fstab with cifs]: https://www.youtube.com/watch?v=A7xH74o6kY0
