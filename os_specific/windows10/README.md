# Windows

## Powershell commands
Use the following command to change bootloader back to debian/grub. Check the following [site][set_grub_in_powershell] for more info
```
bcdedit /set "{bootmgr}" path \EFI\debian\grubx64.efi
```

[set_grub_in_powershell]: https://unix.stackexchange.com/questions/449614/how-to-get-the-grub-menu-back-on-debian
