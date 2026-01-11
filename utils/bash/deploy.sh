#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Script Configuration
# -----------------------------------------------------------------------------
set -e
set -u
set -o pipefail

# -----------------------------------------------------------------------------
# Variable declarations
# -----------------------------------------------------------------------------
DIST="${DIST:-docs/.vitepress/dist}"

# -----------------------------------------------------------------------------
# Pre-flight Checks
# -----------------------------------------------------------------------------
if ! command -v git &>/dev/null; then
    echo "Error: git is not installed."
    exit 1
fi

if [ ! -d "$DIST" ]; then
    echo "Error: Build directory '$DIST' does not exist."
    echo "Please run the build script first."
    exit 1
fi

# -----------------------------------------------------------------------------
# Navigate to the dist (build output) directory
# -----------------------------------------------------------------------------
echo "CHANGED DIRECTORY TO DIST"
cd "$DIST"

# -----------------------------------------------------------------------------
# Commit
# -----------------------------------------------------------------------------
echo "INITIALIZING GIT..."
git init
git add -A
echo "COMMITTING..."
git commit -m 'deploy' || {
    echo "No changes to commit or commit failed"
    exit 0
}

# -----------------------------------------------------------------------------
# Push
# -----------------------------------------------------------------------------
# if you are deploying to https://<USERNAME>.github.io
echo "DEPLOYING..."
git push -f git@github.com:25prabhu10/25prabhu10.github.io.git master

# Navigate back to previous directory
echo "DEPLOYMENT COMPLETE"
cd -
