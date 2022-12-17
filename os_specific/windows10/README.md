# Windows

## Powershell commands
Use the following command to change bootloader back to debian/grub
```
bcdedit /set "{bootmgr}" path \EFI\debian\grubx64.efi
```
