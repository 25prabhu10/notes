---
title: Linux
description: Linux is a family of open-source Unix-like operating systems based on the Linux kernel.
---

# Linux

## Filesystem

Typical Filesystem Hierarchy Standard (FHS): To get more information checkout `man hier`

1. `/bin`:

   - Binaries of important executables and core OS commands (`ls`, `cat`)
   - Typically this directory is symbolically linked to `/usr/bin`

2. `/sbin`:

   - Contains system essential Binaries similar to `/bin`
   - Traditionally the programs in `sbin` were statically linked, thus had fewer library dependencies
   - Binaries containing system administration tools
   - Typically this directory is symbolically linked to `/usr/bin`

3. `/boot`:

   - Contains boot-files, files needed by the bootloader

4. `/dev`:

   - Contains device files
   - These files are dynamically created based on the various physical and virtual devices that are connected to the system
   - Devices are present here
   - All devices are files or directories

5. `/etc`:

   - Critical configuration files and startup scripts
   - System wide configurations
   - Such as settings for `ssh` are present in `vi /etc/ssh/ssh_config`

6. `/home`:

   - Location of the individual user home directories

7. `/lib`, `/lib32`, `/lib64`:

   - Contains shared libraries required by the system programs
   - Typically these directories are symbolically linked to `/usr/lib`

8. `/mnt`:

   - Mount devices temporarily: like attaching a network storage server temporarily
   - Some do permanent mounting

9. `/opt`:

   - Optional directory
   - Optional software packages are placed, mostly by vendors

10. `/proc`:

    - It is a pseudo file-system: a file-system that's created at startup and removed at shutdown
    - It contains the information about every running process on the machine
    - Each active process can have a sub-directory here
    - Also contains system information: such as CPU in `cat /proc/cpuinfo`

11. `/root`:

    - Root directory
    - Home directory for the root user

12. `/run`:

    - Contains information describing the system since boot-time
    - Such as who's logged in and what demons are running
    - Temp `fs` files

13. `/span`:

    - snap packages

14. `/srv`:

    - Occasionally used as a directory for files served by a web server or other server mechanisms such as `ftp`

15. `/sys`:

    - System files
    - Contains information about the devices, drivers, and kernel features
    - Like `/proc` but better structured

16. `/tmp`:

    - Directory to store temporary files and directories

17. `/usr`:

    - Contains most of the programs and utilities the system will run
    - The place where most of the installed programs reside

18. `/var`:

    - System specific variable files: likes logs, temp message files, spool files etc
    - Variable files that grow
    - Some web servers like Apache server files from `/var/www` directory

19. `lost+found`:

    - Contains chunks of broken files after a system crash

20. `/media`:

    - It is the mount mount for file systems stored on removable media
