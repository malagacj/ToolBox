# Debian Live Installation

## Installation

### Entering Debian Live Installer
1. Switch on computer and on Logo Screen press the "ESC"
1. Wait for wizard to pop up and select "Ejecutar Aplicación UEFI"
1. Select USB -> EFI -> BOOT -> BOOTx64.EFI

### Debian Live Installer
Before starting process unplug the Ethernet Cable, as it will get stuck when recognizing Network Devices

1. Select "Debian Installer"
1. On language select:
    1. Installation language: English
    1. Timezone: Spain
    1. Locale: UK
    1. Keyboard: Spanish
1. Don't load missing hardware "rt2860.bin" as it is non-free
1. Plug cable and choose "Qualcom Atheros AR8161 Gigabit Ethernet"
1. Partition Disks:
    1. Delete Debian partitions (5, 6 and 7)
    1. Select "Guided" -> "Largest continuous free space" -> Separate /home partition
    1. Delete newly created partitions (6 and 7) and create them again with appropriate sizes (6:Swap:16Gb and 7:Ext4 journaling file system:200Gb)
    1. Select "Finish partition and write changes to disk"

Follow all the other steps with appropriate values
