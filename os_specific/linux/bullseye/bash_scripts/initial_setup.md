# Initial setup

## Prerequistes
### User executing the script must be a "Sudoer"
If user is not a Sudoer use the "su" command to login as root
```
su
# Enter root password when prompted
```

As the "root" user add <new_user> to the "sudo" group
```
sudo usermod -aG sudo <new_user>
```

Logout and Login again for changes to take effect


## Make Script executable
If script is not executale, make it executable
```
chmod +x initial_setup.sh
```

# Install packages
Execute initial_setup.sh located in this same folder with root privilges
```
sudo ./initial_setup.sh
```
