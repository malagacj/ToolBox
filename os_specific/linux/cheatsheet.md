# Linux 

## Commands

### Generic
```
passwd # Change your password
pwd # Check current directory
whoami # Returns your username

<command> --help # Shows help of that command
<command> -h # Shows help of that command
<command> -? # Shows help of that command

man <command> # Shows Manual of that command
locate <file, command> # Updated once a day
wheris <command> # Returns binaries, man and include
which <command> # Returns binaries
find ~ -name bbb

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
