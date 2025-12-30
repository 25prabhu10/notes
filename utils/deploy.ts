//  ---------------------------------------------------------------------------------
//  Imports
//  ---------------------------------------------------------------------------------

import { spawn, type ChildProcessWithoutNullStreams } from "node:child_process";
import path from "node:path";
import { fileURLToPath } from "node:url";

//  ---------------------------------------------------------------------------------
//  Variable Declarations
//  ---------------------------------------------------------------------------------

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, "..");

//  ---------------------------------------------------------------------------------
//  Main Procedure
//  ---------------------------------------------------------------------------------

console.info(`Deploying from ${process.platform} ...`);

// Check Host OS and run the respective script
let script_process: ChildProcessWithoutNullStreams;
try {
  if (process.platform === "win32") {
    const scriptPath = path.join(__dirname, "win", "deploy.ps1");
    script_process = spawn("cmd.exe", ["/c", scriptPath], { cwd: projectRoot });
  } else if (process.platform === "linux" || process.platform === "darwin") {
    const scriptPath = path.join(__dirname, "bash", "deploy.sh");
    script_process = spawn("bash", [scriptPath], { cwd: projectRoot });
  } else {
    console.error(`Deployment failed. Unsupported platform: ${process.platform}`);
    process.exit(1);
  }
} catch (error) {
  console.error("Failed to spawn process:", error instanceof Error ? error.message : error);
  process.exit(1);
}

//  ---------------------------------------------------------------------------------
//  Logs
//  ---------------------------------------------------------------------------------

// Echoes any command output
script_process.stdout.on("data", (data) => {
  console.info("stdout:", data);
});

// Error output
script_process.stderr.on("data", (data) => {
  console.info("stderr:", data);
});

// Process exit
script_process.on("close", (code) => {
  console.info(`child process exited with code ${code}`);
  process.exit(code ?? 0);
});

// Handle process errors
script_process.on("error", (error) => {
  console.error("Failed to start process:", error.message);
  process.exit(1);
});
