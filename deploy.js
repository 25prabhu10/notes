//  ---------------------------------------------------------------------------------
//  Imports
//  ---------------------------------------------------------------------------------

import { spawn } from 'child_process'
import path from 'path'

//  ---------------------------------------------------------------------------------
//  Variable Declarations
//  ---------------------------------------------------------------------------------

const platform = process.platform

//  ---------------------------------------------------------------------------------
//  Main Procedure
//  ---------------------------------------------------------------------------------

console.log('Deploying from ' + platform + ' ...')

// Check Host OS and run the respective script
let script_process = null
try {
  if (platform === 'win32') {
    script_process = spawn('cmd.exe', [
      '/c',
      path.join('.', 'utils', 'win', 'deploy.ps1'),
    ])
  } else if (platform === 'linux' || platform === 'darwin') {
    script_process = spawn('bash', ['./utils/bash/deploy.sh'])
  } else {
    console.error('Deployment failed. Unsupported platform: ' + platform)
    process.exit(1)
  }
} catch (error) {
  console.error('Failed to spawn process:', error.message)
  process.exit(1)
}

//  ---------------------------------------------------------------------------------
//  Logs
//  ---------------------------------------------------------------------------------

// Echoes any command output
script_process.stdout.on('data', function (data) {
  console.log('stdout: ' + data)
})

// Error output
script_process.stderr.on('data', function (data) {
  console.log('stderr: ' + data)
})

// Process exit
script_process.on('close', function (code) {
  console.log('child process exited with code ' + code)
  process.exit(code || 0)
})

// Handle process errors
script_process.on('error', function (error) {
  console.error('Failed to start process:', error.message)
  process.exit(1)
})
