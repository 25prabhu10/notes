#!/usr/bin/env bash
#
# .SYNOPSIS
#     Synchronizes files from a source directory (e.g., Dropbox) to a local destination directory using rsync.

# .DESCRIPTION
#     This script performs a one-way synchronization from a specified source directory
#     (DROPBOX_SRC) to a local destination directory (NOTES_DEST). It uses rsync to
#     efficiently copy files, preserving attributes and deleting files in the destination
#     that no longer exist in the source (mirroring).

#     Specific directories (.obsidian, .trash) are excluded from the synchronization.
#     The script validates the existence of the source directory and ensures the
#     destination directory is created if it doesn't exist. It includes robust error
#     handling and informational messages.

# .CONFIGURATION
#     - NOTES_DEST: Set the destination directory path (relative or absolute).
#                   Default: "docs/"
#     - DROPBOX_SRC: Set the source directory path. Ensure this path is correct,
#                    accessible (e.g., mounted), and properly quoted if it contains
#                    spaces or special characters.

# .NOTES
#     Requires 'rsync' to be installed and available in the system's PATH.
#     The script uses 'set -e', 'set -u', and 'set -o pipefail' for stricter error checking.
#     The rsync command uses the '--delete' option, which removes files from the
#     destination if they are not present in the source. Be cautious with this option.

# .EXAMPLE
#     ./sync.sh
#     Runs the script with the default source and destination paths defined within the script.
#

# ---------------------------------------------------------------------------------
# Abort on errors
# ---------------------------------------------------------------------------------
# Stop script on NZEC
set -e
# Stop script if unbound variable found (use ${var:-} if intentional)
set -u

# ---------------------------------------------------------------------------------
# Variable declarations
# ---------------------------------------------------------------------------------
NOTES=docs/
DROPBOX=/run/media/prabhu/Local\ Disk/Users/Vinayak/Dropbox/Notes/

# ---------------------------------------------------------------------------------
# Copy files to Dropbox
# ---------------------------------------------------------------------------------
echo "SYNCING FILES FROM DROPBOX TO LOCAL..."

# Ensure destination directory exists
[ -d "$NOTES" ] || mkdir -p "$NOTES"

# Handle path with proper escaping
DROPBOX_PATH=$(echo "$DROPBOX" | sed 's/\\\s/\ /g')

if [ -d "$DROPBOX_PATH" ]; then
    rsync --exclude ".obsidian" --exclude ".trash" -cau "$DROPBOX" "$NOTES"
    echo "SYNC COMPLETED SUCCESSFULLY."
    exit 0
else
    echo "ERROR: DROPBOX DIRECTORY NOT FOUND AT $DROPBOX_PATH"
    echo "PLEASE MOUNT THE C:/ DRIVE OR CHECK THE PATH."
    exit 1
fi


# #!/usr/bin/env bash

# # ---------------------------------------------------------------------------------
# # Script Configuration
# # ---------------------------------------------------------------------------------
# # Exit immediately if a command exits with a non-zero status.
# set -e
# # Treat unset variables as an error when substituting.
# set -u
# # Cause pipelines to return the exit status of the last command that failed,
# # or zero if all commands in the pipeline succeeded.
# set -o pipefail

# # --- Configuration ---
# # Destination directory for the synchronization.
# # Default: 'docs/' relative to the script's execution directory.
# NOTES_DEST="docs/"
# # Source directory for the synchronization.
# # IMPORTANT: Ensure this path is correct and accessible.
# # The example path includes a space escaped with a backslash. Ensure this is intended.
# # If the path doesn't actually contain a literal backslash before the space,
# # remove the backslash and rely on quoting (e.g., "/path/to/Local Disk/...")
# DROPBOX_SRC="/run/media/prabhu/Local Disk/Users/Vinayak/Dropbox/Notes/"

# # ---------------------------------------------------------------------------------
# # Helper Functions
# # ---------------------------------------------------------------------------------
# # Function to print messages to stderr
# error_msg() {
#   printf "ERROR: %s\n" "$@" >&2
# }

# # Function to print informational messages
# info_msg() {
#   printf "%s\n" "$@"
# }

# # ---------------------------------------------------------------------------------
# # Main Script Logic
# # ---------------------------------------------------------------------------------
# info_msg "Starting synchronization from source to destination..."
# info_msg "Source:      '$DROPBOX_SRC'"
# info_msg "Destination: '$NOTES_DEST'"

# # --- Validate Source Directory ---
# # Check if the source directory exists and is a directory.
# # Use quotes to handle potential spaces or special characters in the path.
# if [[ ! -d "$DROPBOX_SRC" ]]; then
#     error_msg "Source directory not found or is not a directory: '$DROPBOX_SRC'"
#     error_msg "Please ensure the path is correct and the source is accessible (e.g., mounted)."
#     exit 1
# fi
# info_msg "Source directory found."

# # --- Ensure Destination Directory Exists ---
# # Create the destination directory if it doesn't exist.
# # The '-p' option ensures parent directories are also created if needed,
# # and it doesn't error if the directory already exists.
# mkdir -p "$NOTES_DEST"
# info_msg "Ensured destination directory exists: '$NOTES_DEST'"

# # --- Perform Synchronization using rsync ---
# info_msg "Running rsync..."
# # Options:
# # -a : archive mode (preserves permissions, timestamps, recursive, etc.)
# # -v : verbose (shows files being transferred)
# # --delete : delete files in destination that are not in the source (makes it a true mirror)
# # --exclude=PATTERN : exclude files/dirs matching PATTERN
# # --progress : show progress during transfer (optional)
# # Note: Trailing slash on source "$DROPBOX_SRC/" copies the *contents* into "$NOTES_DEST".
# rsync -av --delete --exclude ".obsidian" --exclude ".trash" "$DROPBOX_SRC/" "$NOTES_DEST"
# # Check rsync exit code explicitly, although set -e should handle it.
# rsync_exit_code=$?
# if [[ $rsync_exit_code -ne 0 ]]; then
#     error_msg "rsync failed with exit code $rsync_exit_code."
#     exit 1
# fi

# info_msg "Synchronization completed successfully."
# exit 0