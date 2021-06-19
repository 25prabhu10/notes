---
title: Dual Booting OS
description: Install two OS's in one computer.
---

# Dual Booting OS

Install two OS’s in one computer.

## Remove Linux From Dual Boot

Here are two methods to remove the OS.

### Method 1

1. Boot into _Windows 10_.
2. Go to **Disk Management**.
3. Delete the drive(s) containing the _Linux OS_.
4. Delete the **Free Partition**.
5. Then rebuild **`mbr`**.

### Method 2

1. `shift + Restart` -> Troubleshoot -> Advanced options -> `cmd` -> then type:

   ```bash
   bootrec /fixmbr
   bootrec /fixboot
   bootrec /scanos
   bootrec /rebuildbcd
   ```

2. `bcdedit /enum all`

3. `bcdedit /delete identifier`
