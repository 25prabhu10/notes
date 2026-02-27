#!/usr/bin/env bash
#
# .SYNOPSIS
#     Synchronizes files from a source directory to a local destination
#     directory using rsync
#
# .DESCRIPTION
#     This script performs a one-way synchronization from a specified source
#     directory (NOTES_SRC_DIR) to a local destination directory (NOTES_DEST)
#     It uses rsync to efficiently copy files, preserving attributes and
#     deleting files in the destination that no longer exist in the source
#     (mirroring)
#
#     The script validates the existence of the source directory and ensures
#     the destination directory is created if it doesn't exist. It includes
#     robust error handling and informational messages
#
# .ENVIRONMENT VARIABLES
#     NOTES_SRC_DIR   - Set the source directory path. Ensure this path is
#                       correct, accessible (e.g., mounted), and properly
#                       quoted if it contains spaces or special characters
#                       (required)
#     NOTES_DEST      - Set the destination directory path (relative or
#                       absolute) (default: "docs/")
#
# .NOTES
#     Requires 'rsync' to be installed and available in the system's PATH
#     The script uses 'set -Eeuo pipefail' for strict error handling
#
# .EXCEPTIONS
#     The script will exit with an error message if:
#     - Required commands (rsync) are not found
#     - The source directory does not exist or is not a directory
#     - The rsync command fails for any reason
#
# .EXAMPLE
#     ./sync.sh
#     Runs the script with the default source and destination paths

# -----------------------------------------------------------------------------
# Script Configuration
# -----------------------------------------------------------------------------

set -Eeuo pipefail # exit on error, unset variables, pipe failures
trap 'error_msg "Error on line $LINENO"' ERR

# determine script directory (resolves symlinks)
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"

# -----------------------------------------------------------------------------
# Load Utility Functions
# -----------------------------------------------------------------------------

# source utility functions
source "${SCRIPT_DIR}/utils.sh"

# -----------------------------------------------------------------------------
# Variable declarations
# -----------------------------------------------------------------------------

NOTES_DEST="${NOTES_DEST:-docs/}"

if [[ -z "${NOTES_SRC_DIR:-}" ]]; then
  error_msg "NOTES_SRC_DIR environment variable is not set"
  error_msg "Please set NOTES_SRC_DIR to the path of the source directory"
  error_msg "Example: export NOTES_SRC_DIR=\"/path/to/Notes\""
  exit 1
fi

# -----------------------------------------------------------------------------
# Main Script
# -----------------------------------------------------------------------------
info_msg "SYNCING FILES FROM SOURCE TO DESTINATION..."

info_msg "SYNC CONFIGURATION:"
info_msg "  Source:      '${NOTES_SRC_DIR}'"
info_msg "  Destination: '${NOTES_DEST}'"

# Check dependencies
if ! command -v rsync &>/dev/null; then
  error_msg "rsync is not installed or not in PATH"
  exit 1
fi

# Check if the source directory exists and is a directory
if [[ ! -d "${NOTES_SRC_DIR}" ]]; then
  error_msg "Source not found or is not a directory:'${NOTES_SRC_DIR}'"
  error_msg "Please ensure the path is correct and the source is accessible"
  exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "${NOTES_DEST}"

info_msg "Running rsync..."

# Options:
# --exclude=PATTERN : exclude files/dirs matching PATTERN
# -c : skip based on checksum, not mod-time & size
# -a : archive mode (preserves permissions, timestamps, recursive, etc.)
# -u : skip files that are newer on the receiver
# Note: Trailing slash on source "$NOTES_SRC_DIR/" copies the *contents* into
#       "$NOTES_DEST"
declare -a rsync_opts=(
  "--exclude=.obsidian"
  "--exclude=.trash"
  "-cau"
)
rsync "${rsync_opts[@]}" "${NOTES_SRC_DIR}/" "${NOTES_DEST}"

info_msg "SYNC COMPLETED SUCCESSFULLY"
exit 0
