# WDMyCloud

## Mounting Shares

Use the following command to get the password prompted
```bash
sudo mount -t cifs '//WDMyCloud.local/<share_name>' /path/to/mount_folder -o user,ro,noauto,username=<username>
```

Or you can include the password for direct mounting
```bash
sudo mount -t cifs '//WDMyCloud.local/<share_name>' /path/to/mount_folder -o user,ro,noauto,username=<username>,password=<password>
```
