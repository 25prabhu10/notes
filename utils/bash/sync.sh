#!/usr/bin/env bash

# ---------------------------------------------------------------------------------
# Abort on errors
# ---------------------------------------------------------------------------------
set -e

# ---------------------------------------------------------------------------------
# Variable declarations
# ---------------------------------------------------------------------------------
NOTES=docs/
# DROPBOX=/run/media/prabhu/18A22969A2294C96/Users/Vinayak/Dropbox/Notes/
DROPBOX=/run/media/prabhu/Local\ Disk/Users/Vinayak/Dropbox/Notes/

# ---------------------------------------------------------------------------------
# Copy files to Dropbox
# ---------------------------------------------------------------------------------
echo "COPYING LATEST FILES..."
if [ -d "$DROPBOX" ]
then
    rsync --exclude ".obsidian" --exclude ".trash" -cau "$DROPBOX" "$NOTES"
    exit 0
else
    echo "Please mount the C:/ drive."
    exit 1
fi
