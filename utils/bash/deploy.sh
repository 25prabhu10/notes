#!/usr/bin/env bash

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
DIST=docs/.vitepress/dist

# ---------------------------------------------------------------------------------
# Navigate to the dist (build output) directory
# ---------------------------------------------------------------------------------
echo "CHANGED DIRECTORY TO DIST"
cd "$DIST"

# ---------------------------------------------------------------------------------
# Commit
# ---------------------------------------------------------------------------------
echo "INITIALIZING GIT..."
git init
git add -A
echo "COMMITTING..."
git commit -m 'deploy' || {
  echo "No changes to commit or commit failed"
  exit 0
}

# ---------------------------------------------------------------------------------
# Push
# ---------------------------------------------------------------------------------
# if you are deploying to https://<USERNAME>.github.io
echo "DEPLOYING..."
git push -f git@github.com:25prabhu10/25prabhu10.github.io.git master

# Navigate back to previous directory
echo "DEPLOYMENT COMPLETE"
cd -
