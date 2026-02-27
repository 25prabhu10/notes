#!/usr/bin/env bash
#
# .SYNOPSIS
#     Utility functions for bash scripts in the project
#
# .DESCRIPTION:
#     This script contains common utility functions that can be sourced and
#     used by other bash scripts in the project. It includes functions for
#     error handling, logging, and other common tasks to promote code reuse and
#     maintainability
#
# .CONFIGURATION:
#     This script does not require any specific configuration. It is intended
#     to be sourced by other scripts, which can then call the functions defined
#     here
#
# .NOTES:
#     - Ensure that this script is sourced at the beginning of any bash script
#     that intends to use the utility functions defined here
#     - The functions defined in this script are designed to be simple and
#     reusable across different scripts in the project
#
# .EXCEPTIONS:
#     This script does not handle any specific exceptions. The functions
#     defined here are meant to be used in conjunction with proper error
#     handling in the scripts that source this utility script
#
# .EXAMPLE:
#     # In another bash script, you can source this file and use its functions:
#
#     #!/usr/bin/env bash
#     source /path/to/bash/utils.sh
#     error_msg "This is an error message"
#     info_msg "This is an informational message"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

# function to print messages
error_msg() {
  printf "ERROR: %s\n" "$*" >&2
}

# function to print informational messages
info_msg() {
  printf "%s\n" "$*" >&2
}

# function to handle errors and provide informative messages
handle_error() {
  local -r line_num=$1
  local -r cmd="${*:2}"

  error_msg "on line ${line_num} (command: ${cmd})"
}

# function to check if an environment variable is set and not empty
check_env_var() {
  local -r var_name="$1"
  local -r var_value="${!var_name:-}"

  if [[ -z "${var_value}" ]]; then
    error_msg "'${var_name}' is not set. Set it in env PATH or .env file"
    error_msg "  export ${var_name}=\"some_value\""
    exit 1
  fi
}
