---
title: Bash Snippets
description: Collection of CLI applications and commands.
---

# Bash Snippets

## General

### 7z or zip

- 7z with ultra compression:

  ```bash
  7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on archive.7z dir1
  ```

### ffmpeg

- Simple conversion of videos:

  ```bash
  ffmpeg -i input.mp4 output.mp4
  ```

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

- Clear pacman cache

  ```bash
  # GET TOTAL CACHED PACKAGES
  sudo ls /var/cache/pacman/pkg/ | wc -l

  # GET TOTAL CACHE SIZE
  du -sh /var/cache/pacman/pkg/

  # CLEAN ALL PACKAGES, EXPECT THE 3 MOST RECENT VERSIONS
  sudo paccache -r

  # CLEAN ALL PACKAGES, EXPECT THE n MOST RECENT VERSIONS
  sudo paccache -rk n

  # REMOVE ALL UNINSTALLED PACKAGES
  sudo paccache -ruk0

  # OR
  sudo pacman -Sc

  # REMOVE ALL INSTALLED AND UNINSTALLED PACKAGE CACHE
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
