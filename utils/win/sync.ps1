<#
.SYNOPSIS
    Synchronizes files and directories from a source path to a destination path using robocopy.

.DESCRIPTION
    This script performs a one-way synchronization from a specified source directory to a destination directory.
    It uses robocopy to efficiently copy files, preserving timestamps and attributes.
    Specific directories (.obsidian, .trash) are excluded from the synchronization.
    The script ensures the destination directory exists before starting the sync.
    It handles robocopy exit codes to report success or failure.

.PARAMETER SourcePath
    Specifies the source directory path from which files will be copied.
    This directory must exist.

.PARAMETER DestinationPath
    Specifies the destination directory path to which files will be copied.
    If it doesn't exist, it will be created.

.EXAMPLE
    .\sync.ps1 -SourcePath "D:\Users\User\Notes" -DestinationPath ".\docs" -Verbose
    Synchronizes files from the Dropbox Notes directory to the local docs directory, showing verbose output.

.EXAMPLE
    .\sync.ps1 -WhatIf
    Shows what actions would be taken by the script without actually performing the synchronization.

.NOTES
    Requires robocopy.exe to be available in the system's PATH.
    Robocopy exit codes 0-7 are considered success. Higher codes indicate errors.
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true, HelpMessage = "Enter the source directory path.")]
    [ValidateScript({
        if (Test-Path -Path $_ -PathType Container) {
            return $true
        } else {
            throw "Source path '$_' not found or is not a directory."
        }
    })]
    [string]$SourcePath = "D:\Users\Vinayak\Dropbox\Notes\",

    [Parameter(Mandatory = $true, HelpMessage = "Enter the destination directory path.")]
    [string]$DestinationPath = "docs\"
)

# ---------------------------------------------------------------------------------
# Error handling - Stop on script-terminating errors (like validation failures)
# Non-terminating errors from cmdlets will be handled individually if needed.
# Robocopy errors are handled via $LASTEXITCODE.
# ---------------------------------------------------------------------------------
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------------
# Sync files from Source to Destination
# ---------------------------------------------------------------------------------
Write-Verbose "Starting synchronization from '$SourcePath' to '$DestinationPath'."

# Ensure destination directory exists
$destinationExists = Test-Path -Path $DestinationPath -PathType Container
if (-not $destinationExists) {
    Write-Verbose "Destination directory '$DestinationPath' does not exist."
    if ($PSCmdlet.ShouldProcess($DestinationPath, "Create Directory")) {
        try {
            New-Item -Path $DestinationPath -ItemType Directory -Force -ErrorAction Stop | Out-Null
            Write-Verbose "Successfully created destination directory: '$DestinationPath'."
        } catch {
            Write-Error "Failed to create destination directory '$DestinationPath'. Error: $($_.Exception.Message)"
            # Script will terminate due to $ErrorActionPreference = 'Stop'
        }
    } else {
        # If -WhatIf is used and directory doesn't exist, stop the script.
        Write-Warning "'-WhatIf' specified: Cannot proceed without creating destination directory '$DestinationPath'."
        return
    }
} else {
     Write-Verbose "Destination directory '$DestinationPath' already exists."
}

# Define robocopy arguments
$robocopyArgs = @(
    $SourcePath,
    $DestinationPath,
    "/E",                 # Copy subdirectories, including Empty ones
    "/XD",                # Exclude directories matching the following names
    ".obsidian",
    ".trash",
    "/XO",                # Exclude Older files (only copy if source is newer)
    "/COPY:DAT",          # Copy Data, Attributes and Timestamps
    "/DCOPY:T",           # Copy directory Timestamps
    "/R:3",               # Retry 3 times on failed copies
    "/W:1",               # Wait 1 second between retries
    "/MT:8",              # Use 8 threads for copying
    "/NFL",               # No File List - don't log file names
    "/NDL"                # No Directory List - don't log directory names
    # Consider adding /NJH (No Job Header) and /NJS (No Job Summary) for less verbose output
)

Write-Verbose "Running Robocopy with arguments: $($robocopyArgs -join ' ')"

if ($PSCmdlet.ShouldProcess($DestinationPath, "Synchronize from '$SourcePath'")) {
    try {
        # Execute robocopy
        & robocopy @robocopyArgs

        # Check the exit code from robocopy
        # Exit codes 0-7 indicate success (some files copied, extra files present, etc.)
        # Exit codes >= 8 indicate failure.
        if ($LASTEXITCODE -lt 8) {
            Write-Verbose "Robocopy completed successfully (Exit Code: $LASTEXITCODE)."
            Write-Host "Synchronization from '$SourcePath' to '$DestinationPath' completed successfully."
        } else {
            # Throw a terminating error for robocopy failures
            throw "Robocopy failed with Exit Code $LASTEXITCODE. Check robocopy logs or output for details."
        }
    } catch {
        # Catch errors from robocopy execution or the explicit throw above
        Write-Error "Synchronization failed. Error: $($_.Exception.Message)"
        # Script will terminate due to $ErrorActionPreference = 'Stop'
    }
} else {
     Write-Warning "'-WhatIf' specified: Robocopy synchronization not executed."
}

Write-Verbose "Script finished."