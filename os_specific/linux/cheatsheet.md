# Linux 

## Commands

### Generic
```
uptime # time since computer booted up
df -h # Disk Space Utilization
du -sh /home # Space Utilization i.e /home
sudo mkfs.ext4 /dev/sdg # Resets sdg to ext4
```

### TAR
```
tar -xf <tarfile>
```

### Display Server
In Gnome choose the option Xorg to log into X11, otherwise it will login
to Wayland

```
echo $XDG_SESSION_TYPE # Display Server being used
```
