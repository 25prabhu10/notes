---
title: Bash Snippets
description: Collection of CLI applications and commands.
---

# Bash Snippets

## General

1. Find difference in output of two shell commands:

   ```bash
   diff <(ls) <(ll)

   # or to see all the difference similar to (n)vim -d (diff)
   nvim <(pacman -Qi nvim) <(pacman -Si nvim)
   ```

2. Upload files and share for free (limit 10GB):

   ```bash
   curl --upload-file ./hello.txt https://transfer.sh/hello.txt
   ```

3. Translate or delete charaters:

   ```bash
   echo $PATH
   # /home/prabhu/.local/bin:/usr/local/sbin

   echo $PATH | tr ':' '\n'
   # /home/prabhu/.local/bin
   # /usr/local/sbin
   ```

4. Columnate lists:

   ```bash
   mount | column -t
   ```

[Arch Webcam Setup](https://wiki.archlinux.org/title/webcam_setup)

## Images

- Compress image:

  ```bash
  mogrify -compress JPEG -quality 50 /path/to/image.jpg

  # OR

  convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% /path/to/source/image.jpg /path/to/result/image.jpg

  # OR

  jpegoptim --size=512k /path/to/image.jpg
  ```

## 7z

- 7z with ultra compression:

  ```bash
  7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on archive.7z dir1
  ```

## ffmpeg

- Simple conversion of videos:

  ```bash
  ffmpeg -i input.mp4 output.mp4
  ```

[ffmpeg documentation](../../Collection/FFmpeg)

## mpv

Use mpv to take snapshots from webcam:

```bash
mpv av://v4l2:/dev/video0 --profile=low-latency --untimed
```

To use MJPEG as the pixelformat instead of the default, which in most cases is YUYV, you can run the following instead:

```bash
mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0
```

In some cases this can lead to drastic improvements in quality and performance (5FPS -> 30FPS for example), [see the mpv documentation](https://github.com/mpv-player/mpv/wiki/Video4Linux2-Input)

## Python

### pip

- pip batch update:

  ```bash
  pip install -U `pip list --outdated | tail -n +3 | awk '{print $1}'`
  ```

## Manjaro

### Pacman

- List all installed packages sorted by size:

  ```bash
  pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
  ```

- Clear _pacman_ cache

  ```bash
  # get total cached packages
  sudo ls /var/cache/pacman/pkg/ | wc -l

  # get total cache size
  du -sh /var/cache/pacman/pkg/

  # clean all packages, expect the 3 most recent versions
  sudo paccache -r

  # clean all packages, expect the n most recent versions
  sudo paccache -rk n

  # remove all uninstalled packages
  sudo paccache -ruk0

  # OR
  sudo pacman -Sc

  # remove all installed and uninstalled package cache
  sudo pacman -Scc
  ```

- Alternative create a hook to auto clean cache

  ```bash
  sudo vi /etc/pacman.d/hooks/clean_package_cache.hook
  ```

  ```text
  [Trigger]
  Operation = Upgrade
  Operation = Install
  Operation = Remove
  Type = Package
  Target = *
  [Action]
  Description = Cleaning pacman cache...
  When = PostTransaction
  Exec = /usr/bin/paccache -r
  ```

> Refer: [Recommended ways to clean cache](https://ostechnix.com/recommended-way-clean-package-cache-arch-linux/)

## KDE

### Baloo File Indexer

- Disable it

  ```bash
  balooctl suspend
  balooctl disable
  ```
