#!/usr/bin/env bash
#
# .SYNOPSIS
#     Synchronizes files from a source directory to a local destination directory using rsync.
#
# .DESCRIPTION
#     This script performs a one-way synchronization from a specified source directory
#     (NOTES_SRC_DIR) to a local destination directory (NOTES_DEST). It uses rsync to
#     efficiently copy files, preserving attributes and deleting files in the destination
#     that no longer exist in the source (mirroring).
#
#     The script validates the existence of the source directory and ensures the
#     destination directory is created if it doesn't exist. It includes robust error
#     handling and informational messages.
#
# .CONFIGURATION
#     - NOTES_DEST: Set the destination directory path (relative or absolute).
#                   Default: "docs/"
#     - NOTES_SRC_DIR: Set the source directory path. Ensure this path is correct,
#                    accessible (e.g., mounted), and properly quoted if it contains
#                    spaces or special characters.
#
# .NOTES
#     Requires 'rsync' to be installed and available in the system's PATH.
#     The script uses 'set -e', 'set -u', and 'set -o pipefail' for stricter error checking.
#     The rsync command uses the '--delete' option, which removes files from the
#     destination if they are not present in the source. Be cautious with this option.
#
# .EXCEPTIONS
#     The script will exit with an error message if:
#     - The source directory does not exist or is not a directory.
#     - The rsync command fails for any reason.
#
# .EXAMPLE
#     ./sync.sh
#     Runs the script with the default source and destination paths defined within the script.

# ---------------------------------------------------------------------------------
# Script Configuration
# ---------------------------------------------------------------------------------
# Exit immediately if a command exits with a non-zero status.
# Stop script on NZEC
set -e
# Stop script if unbound variable found (use ${var:-} if intentional)
set -u
# Cause pipelines to return the exit status of the last command that failed,
# or zero if all commands in the pipeline succeeded.
set -o pipefail

# ---------------------------------------------------------------------------------
# Variable declarations
# ---------------------------------------------------------------------------------
# Destination directory for the synchronization.
NOTES_DEST="${NOTES_DEST:-docs/}"

# Source directory for the synchronization.
if [ -z "$NOTES_SRC_DIR" ]; then
  echo "Error: NOTES_SRC_DIR environment variable is not set."
  echo "Please set NOTES_SRC_DIR to the path of the source directory."
  echo "Example: export NOTES_SRC_DIR=\"/path/to/Notes\""
  exit 1
fi

# ---------------------------------------------------------------------------------
# Helper Functions
# ---------------------------------------------------------------------------------
# Function to print messages to stderr
error_msg() {
  printf "ERROR: %s\n" "$@" >&2
}

info_msg() {
  printf "%s\n" "$@"
}

# ---------------------------------------------------------------------------------
# Main Script
# ---------------------------------------------------------------------------------
info_msg "SYNCING FILES FROM SORUCE TO DESTINATION..."
info_msg "Source:      '$NOTES_SRC_DIR'"
info_msg "Destination: '$NOTES_DEST'"

# Check if the source directory exists and is a directory.
if [ ! -d "$NOTES_SRC_DIR" ]; then
  error_msg "Source directory not found or is not a directory: '$NOTES_SRC_DIR'"
  error_msg "Please ensure the path is correct and the source is accessible (e.g., mounted)."
  exit 1
fi

# Create the destination directory if it doesn't exist.
mkdir -p "$NOTES_DEST"

info_msg "Running rsync..."
# Options:
# --exclude=PATTERN : exclude files/dirs matching PATTERN
# -a : archive mode (preserves permissions, timestamps, recursive, etc.)
# -c : skip based on checksum, not mod-time & size
# -u : skip files that are newer on the receiver
# Note: Trailing slash on source "$NOTES_SRC_DIR/" copies the *contents* into "$NOTES_DEST".
rsync --exclude ".obsidian" --exclude ".trash" -cau "$NOTES_SRC_DIR/" "$NOTES_DEST"

info_msg "SYNC COMPLETED SUCCESSFULLY"
exit 0
