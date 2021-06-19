"use strict";

//  ---------------------------------------------------------------------------------
//  Imports
//  ---------------------------------------------------------------------------------
const spawn = require("child_process").spawn;

//  ---------------------------------------------------------------------------------
//  Variable Declarations
//  ---------------------------------------------------------------------------------
const platform = process.platform;
let script_process;

//  ---------------------------------------------------------------------------------
//  Main Procedure
//  ---------------------------------------------------------------------------------
console.log("Deploying from " + platform + " ...");

// Check Host OS and run the respective script
if (platform === "win32") {
  script_process = spawn("cmd.exe", ["/c", "deploy.bat"]);
} else if (platform === "linux") {
  script_process = spawn("bash", ["./utils/bash/deploy.sh"]);
} else {
  console.log("Deployment failed. Due to unknown platform !!!");
}

//  ---------------------------------------------------------------------------------
//  Logs
//  ---------------------------------------------------------------------------------
// Echoes any command output
script_process.stdout.on("data", function (data) {
  console.log("stdout: " + data);
});

// Error output
script_process.stderr.on("data", function (data) {
  console.log("stderr: " + data);
});

// Process exit
script_process.on("close", function (code) {
  console.log("child process exited with code " + code);
});
