---
title: Manjaro OS
description: Free fast, arch Linux based operating system.
---

# Manjaro OS

Things to do after installing _Manjaro OS_.

## Disable Start-Up Process

1. Stop and disable **Bluetooth**:

   ```bash
   sudo systemctl stop bluetooth.service
   sudo systemctl disable bluetooth.service
   systemctl status bluetooth.service
   ```

   ::: tip REFERENCE
   [Cleaning Your Linux Startup Process](https://www.linux.com/topic/desktop/cleaning-your-linux-startup-process/)
   :::

2. To stop other service to start Bluetooth, mask it using `sudo systemctl mask bluetooth.service`
