#!/usr/bin/env bash
#
# .SYNOPSIS
#     Deploys static build output to a GitHub Pages repository
#
# .DESCRIPTION
#     This script takes the static build output (e.g., from VitePress),
#     initializes a fresh Git repository inside the build directory, commits
#     all files, and force-pushes to the configured GitHub Pages repository
#
# .ENVIRONMENT VARIABLES
#     DIST           - Path to the build output directory (required)
#     DEPLOY_REPO    - Git remote URL for the GitHub Pages repo (required)
#     DEPLOY_BRANCH  - Target branch to push to (default: "main")
#     COMMIT_MSG     - Commit message for the deploy commit (default: "deploy")
#
# .NOTES
#     - Requires 'git' to be installed and available in PATH
#     - Uses 'set -Eeuo pipefail' for strict error checking
#     - The script should be run from the project root or with appropriate
#     environment variables set
#
# .EXCEPTIONS
#     The script will exit with an error message if:
#     - Required commands (git) are not found
#     - The build directory does not exist
#     - The build directory fails artifact validation (missing index.html)
#     - The git commit or push fails
#
# .EXAMPLE
#     export DIST="docs/.vitepress/dist"
#     export DEPLOY_REPO="https://github.com/username/username.github.io.git"
#     export DEPLOY_BRANCH="gh-pages"
#     export COMMIT_MSG="Deploying to GitHub Pages"
#     ./deploy.sh

# -----------------------------------------------------------------------------
# Script Configuration
# -----------------------------------------------------------------------------

set -Eeuo pipefail

# determine script directory (resolves symlinks)
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)"

# lockfile path (per-project, in /tmp)
LOCKFILE="/tmp/deploy-$(echo "${SCRIPT_DIR}" | sha256sum | cut -d' ' -f1).lock"
LOCK_ACQUIRED=false

# -----------------------------------------------------------------------------
# Load Utility Functions
# -----------------------------------------------------------------------------

# source utility functions
source "${SCRIPT_DIR}/utils.sh"

# -----------------------------------------------------------------------------
# Clean-up & Error Traps
# -----------------------------------------------------------------------------

cleanup() {
    local exit_code=$?

    # Remove lockfile on exit only if we acquired it
    if [[ "${LOCK_ACQUIRED}" == true ]]; then
        rm -f "${LOCKFILE}"
    fi

    if [[ ${exit_code} -ne 0 ]]; then
        error_msg "Script failed (exit code: ${exit_code})"
    fi

    exit "${exit_code}"
}

trap cleanup EXIT

# Set up error handling to catch any errors and provide informative messages
trap 'handle_error ${LINENO} "${BASH_COMMAND}"' ERR

# -----------------------------------------------------------------------------
# Variable Declarations
# -----------------------------------------------------------------------------

DIST="${DIST:-}"
check_env_var "DIST"

DEPLOY_REPO="${DEPLOY_REPO:-}"
check_env_var "DEPLOY_REPO"

DEPLOY_BRANCH="${DEPLOY_BRANCH:-main}"
COMMIT_MSG="${COMMIT_MSG:-deploy}"

# -----------------------------------------------------------------------------
# Concurrency Guard
# -----------------------------------------------------------------------------

if ! command -v flock &>/dev/null; then
    info_msg "WARNING: 'flock' not found; skipping concurrency guard"
else
    exec 9>"${LOCKFILE}"
    if ! flock -n 9; then
        error_msg "Another deploy is already running (lockfile: ${LOCKFILE})"
        exit 1
    fi
    LOCK_ACQUIRED=true
fi

# -----------------------------------------------------------------------------
# Pre-flight Checks
# -----------------------------------------------------------------------------

if ! command -v git &>/dev/null; then
    error_msg "git is not installed"
    exit 1
fi

# validate build directory exists
if [[ ! -d "${DIST}" ]]; then
    error_msg "Build directory '${DIST}' does not exist"
    error_msg "Please run the build script first"
    exit 1
fi

# validate build artifacts
if [[ ! -f "${DIST}/index.html" ]]; then
    error_msg "Build artifact: '${DIST}/index.html' not found"
    error_msg "The build may be incomplete or corrupted"
    exit 1
fi

# -----------------------------------------------------------------------------
# Initialize git repository, add all files, and commit changes
# -----------------------------------------------------------------------------
info_msg "DEPLOY CONFIGURATION:"
info_msg "  Destination:    ${DIST}"
info_msg "  Repository:     ${DEPLOY_REPO}"
info_msg "  Branch:         ${DEPLOY_BRANCH}"
info_msg "  Commit Msg:     ${COMMIT_MSG}"

info_msg "INITIALIZING GIT..."
git -C "${DIST}" init -b main
git -C "${DIST}" add -A

info_msg "COMMITTING..."
git -C "${DIST}" commit -m "${COMMIT_MSG}"

# -----------------------------------------------------------------------------
# Push to GitHub Pages repository (force push to main branch)
# -----------------------------------------------------------------------------

info_msg "DEPLOYING..."

# if you are deploying to https://<USERNAME>.github.io
git -C "${DIST}" push -f "${DEPLOY_REPO}" "HEAD:${DEPLOY_BRANCH}"

info_msg "DEPLOYMENT COMPLETE"
