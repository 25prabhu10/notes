<#
.SYNOPSIS
    Builds and deploys the VitePress site to a specified GitHub Pages repo.

.DESCRIPTION
    This script automates the deployment process for a VitePress site.
    It navigates to the distribution directory, initializes a git repository (if needed),
    commits all changes, and force-pushes the contents to the 'master' branch
    of the specified GitHub repository, typically configured for GitHub Pages.

.PARAMETER DistPath
    The relative path to the VitePress build output directory (e.g., "docs/.vitepress/dist").

.PARAMETER RemoteUrl
    The URL of the remote Git repository to push the deployment to.

.PARAMETER BranchName
    The name of the branch to push the deployment to (e.g., "master", "gh-pages").

.EXAMPLE
    .\deploy.ps1
    Deploys the content from "docs/.vitepress/dist" to the 'master' branch of 'git@github.com:username/username.github.io.git'.

.EXAMPLE
    .\deploy.ps1 -DistPath "build" -RemoteUrl "git@github.com:myuser/myrepo.git" -BranchName "gh-pages" -Verbose
    Deploys the content from the "build" directory to the 'gh-pages' branch of the specified repository with verbose output.

.NOTES
    Author: GitHub Copilot
    Requires Git to be installed and available in the system's PATH.
    Uses force push (`git push -f`), which overwrites the history of the target branch. Use with caution.
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
param(
    [Parameter(Mandatory, Position = 0, HelpMessage = 'Relative path to VitePress build output.')]
    [ValidateNotNullOrEmpty()]
    [string]$DistPath = 'docs/.vitepress/dist',

    [Parameter(Mandatory, Position = 1, HelpMessage = 'Remote Git repo URL for deployment.')]
    [ValidateNotNullOrEmpty()]
    [string]$RemoteUrl = 'git@github.com:username/username.github.io.git',

    [Parameter(Mandatory, Position = 2, HelpMessage = 'Target branch name for deployment.')]
    [ValidateNotNullOrEmpty()]
    [string]$BranchName = 'master'
)

# ---------------------------------------------------------------------------------
# Error handling - Stop on script-terminating errors
# ---------------------------------------------------------------------------------
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------------
# Variable declarations
# ---------------------------------------------------------------------------------
# Resolve the path relative to the script's location for robustness
$ScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$FullDistPath = Join-Path -Path $ScriptRoot -ChildPath $DistPath

# Check if the distribution directory exists
if (-not (Test-Path -Path $FullDistPath -PathType Container)) {
    Write-Error "Distribution directory not found: '$FullDistPath'"
    exit 1 # Exit with a non-zero code to indicate failure
}

# ---------------------------------------------------------------------------------
# Navigate to the dist (build output) directory
# ---------------------------------------------------------------------------------
Write-Verbose "Changing directory to '$FullDistPath'"
Push-Location -Path $FullDistPath -ErrorAction Stop

try {
    # ---------------------------------------------------------------------------------
    # Deployment Steps
    # ---------------------------------------------------------------------------------
    if ($PSCmdlet.ShouldProcess($FullDistPath, "Deploy to $RemoteUrl branch $BranchName")) {

        Write-Verbose "Initializing Git repository..."
        git init | Out-Null # Suppress output unless verbose
        if ($LASTEXITCODE -ne 0) { throw "Git init failed." }

        Write-Verbose "Adding all files to Git..."
        git add -A
        if ($LASTEXITCODE -ne 0) { throw "Git add failed." }

        # Check if there are changes to commit
        $gitStatus = git status --porcelain
        if (-not $gitStatus) {
            Write-Host "No changes detected. Deployment not required."
            # No need to exit here, just skip commit and push
        } else {
            Write-Verbose "Committing changes..."
            git commit -m 'deploy: automated deployment'
            if ($LASTEXITCODE -ne 0) { throw "Git commit failed." }

            Write-Verbose "Pushing changes to $RemoteUrl ($BranchName)..."
            git push -f $RemoteUrl "$($BranchName):$($BranchName)" # Explicitly specify local:remote
            if ($LASTEXITCODE -ne 0) { throw "Git push failed." }

            Write-Host "Deployment complete to $RemoteUrl branch $BranchName."
        }
    } else {
        Write-Warning "'-WhatIf' specified: Deployment steps skipped."
    }

}
catch {
    Write-Error "Deployment failed: $($_.Exception.Message)"
    # Consider re-throwing to preserve the original error record and stack trace
    # throw $_
    exit 1 # Exit with a non-zero code to indicate failure
}
finally {
    # Return to previous directory regardless of success or failure
    Write-Verbose "Returning to original directory."
    Pop-Location
}

Write-Verbose "Script finished."
# Implicit exit 0 on success


# [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Low')]
# param(
#     [Parameter(Mandatory, Position = 0, HelpMessage = 'Relative path to VitePress build output.')]
#     [ValidateNotNullOrEmpty()]
#     [string]$DistPath = 'docs/.vitepress/dist',

#     [Parameter(Mandatory, Position = 1, HelpMessage = 'Remote Git repo URL for deployment.')]
#     [ValidateNotNullOrEmpty()]
#     [string]$RemoteUrl = 'git@github.com:username/username.github.io.git',

#     [Parameter(Mandatory, Position = 2, HelpMessage = 'Target branch name for deployment.')]
#     [ValidateNotNullOrEmpty()]
#     [string]$BranchName = 'master'
# )

# $ErrorActionPreference = 'Stop'

# # Resolve absolute path to the distribution directory
# $ScriptRoot    = Split-Path -Parent $MyInvocation.MyCommand.Path
# $FullDistPath  = Join-Path $ScriptRoot $DistPath

# if (-not (Test-Path -Path $FullDistPath -PathType Container)) {
#     throw "Distribution directory not found: '$FullDistPath'"
# }

# Write-Verbose "Resolved distribution directory: $FullDistPath"

# if ($PSCmdlet.ShouldProcess("$FullDistPath → $RemoteUrl/$BranchName", 'Deploy site')) {
#     Push-Location -Path $FullDistPath

#     try {
#         Write-Verbose 'Initializing Git repository (if not already)...'
#         git init --quiet
#         if ($LASTEXITCODE -ne 0) { throw 'git init failed.' }

#         Write-Verbose 'Staging all files...'
#         git add -A
#         if ($LASTEXITCODE -ne 0) { throw 'git add failed.' }

#         $changes = git status --porcelain
#         if (-not $changes) {
#             Write-Host 'No changes to deploy. Exiting.'
#             return
#         }

#         Write-Verbose 'Committing changes...'
#         git commit --message 'deploy: automated deployment' --quiet
#         if ($LASTEXITCODE -ne 0) { throw 'git commit failed.' }

#         Write-Verbose "Pushing to $RemoteUrl ($BranchName) with force..."
#         git push --force $RemoteUrl "HEAD:$BranchName" --quiet
#         if ($LASTEXITCODE -ne 0) { throw 'git push failed.' }

#         Write-Host "Deployment succeeded to $RemoteUrl#$BranchName."
#     }
#     catch {
#         throw "Deployment failed: $($_.Exception.Message)"
#     }
#     finally {
#         Pop-Location
#     }
# }
# else {
#     Write-Verbose 'Deployment skipped by ShouldProcess/WhatIf.'
# }