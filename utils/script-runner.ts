//  ------------------------------------------------------------------------------------------------
//  Imports
//  ------------------------------------------------------------------------------------------------

import { spawn, spawnSync, type ChildProcess } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

//  ------------------------------------------------------------------------------------------------
//  Variable Declarations
//  ------------------------------------------------------------------------------------------------

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, "..");
const scriptName = process.argv[2];
const scriptArgs = process.argv.slice(3);

const UNIX_PLATFORMS = new Set(["linux", "darwin"]);

interface ScriptCommand {
  command: string;
  args: string[];
  scriptPath: string;
}

//  ------------------------------------------------------------------------------------------------
//  Main Procedure
//  ------------------------------------------------------------------------------------------------

/**
 * Prints usage information and exits the process
 *
 * @param {number} exitCode The exit code to use when exiting the process
 * @param {string} message Optional error message to display before usage
 * information
 */
function printUsage(exitCode: number, message?: string): void {
  if (message?.trim() !== "") {
    console.error(message);
  }

  console.info("Usage: node ./utils/deploy.ts <script-name> [...script-args]");
  console.info("Examples:");
  console.info("  node ./utils/deploy.ts sync");
  console.info("  node ./utils/deploy.ts deploy");
  process.exit(exitCode);
}

if (scriptName === "--help" || scriptName === "-h") {
  printUsage(0);
} else if (!scriptName || scriptName.trim() === "") {
  printUsage(1, "Missing required script name.");
} else if (scriptName.length > 250) {
  printUsage(1, "Script name is too long. Ensure it's a valid file name without extensions.");
}

console.info(`Running "${scriptName}" script on ${process.platform} ...`);

// Check Host OS and run the respective script
let scriptProcess: ChildProcess;
try {
  const scriptCommand = resolveScriptCommand(scriptName, scriptArgs); // oxlint-disable-line no-use-before-define
  const relativeScriptPath = path.relative(projectRoot, scriptCommand.scriptPath);
  console.info(`Using script: ${relativeScriptPath}`);

  scriptProcess = spawn(scriptCommand.command, scriptCommand.args, {
    cwd: projectRoot,
    stdio: "inherit",
  });
} catch (error) {
  console.error(
    "Failed to resolve script execution:",
    error instanceof Error ? error.message : error
  );
  process.exit(1);
}

// Forward termination signals to the child process
const FORWARDED_SIGNALS: NodeJS.Signals[] = ["SIGINT", "SIGTERM", "SIGHUP"];
for (const signal of FORWARDED_SIGNALS) {
  process.on(signal, () => {
    // oxlint-disable-line no-loop-func
    if (scriptProcess.exitCode === null && !scriptProcess.killed) {
      scriptProcess.kill(signal);
    }
  });
}

// Process exit
scriptProcess.on("close", (code, signal) => {
  if (signal) {
    console.error(`child process terminated by signal ${signal}`);
    process.exit(1);
  }

  const exitCode = code ?? 1;
  console.info(`child process exited with code ${exitCode}`);
  process.exit(exitCode);
});

// Handle process errors
scriptProcess.on("error", (error) => {
  console.error("Failed to start process:", error.message);
  process.exit(1);
});

//  ------------------------------------------------------------------------------------------------
//  Utility Functions
//  ------------------------------------------------------------------------------------------------

/**
 * Asserts that a script file exists at the given path. If the file does not
 * exist, an error is thrown with the provided message
 *
 * @param {string} scriptPath The absolute path to the script file to check
 * @param {string} message The error message to include if the file does not
 * exist
 * @throws Will throw an error if the script file does not exist at the
 * specified path
 */
function assertScriptExists(scriptPath: string, message: string): void {
  if (!fs.existsSync(scriptPath)) {
    throw new Error(`${message} Expected path: ${path.relative(projectRoot, scriptPath)}`);
  }
}

/**
 * Resolves the appropriate Bash script command for Unix-like systems
 * Checks for the existence of the script file and constructs the command to
 * execute it with Bash
 *
 * @param {string} name The name of the script to resolve (without extension)
 * @param {string[]} args Additional arguments to pass to the script
 * @returns {ScriptCommand} An object containing the command, arguments, and
 * script path to execute
 * @throws Will throw an error if the script cannot be found at the expected
 * path
 */
function resolveUnixScript(name: string, args: string[]): ScriptCommand {
  const scriptPath = path.join(__dirname, "bash", `${name}.sh`);
  assertScriptExists(scriptPath, `No Bash script found for "${name}".`);

  return {
    args: [scriptPath, ...args],
    command: "bash",
    scriptPath,
  };
}

/**
 * Attempts to find a valid PowerShell executable on the system
 *
 * Checks for "pwsh" (PowerShell Core) first, then falls back to "powershell"
 * (Windows PowerShell)
 * If neither is found, an error is thrown
 *
 * @returns {string} The name of the PowerShell executable to use
 * @throws Will throw an error if no PowerShell executable is found
 */
function resolvePowerShellShell(): string {
  const candidates = ["pwsh", "powershell"];

  for (const candidate of candidates) {
    const check = spawnSync(candidate, ["-NoProfile", "-Command", "exit 0"], {
      stdio: "ignore",
    });

    if (!check.error && check.status === 0) {
      return candidate;
    }
  }

  throw new Error("PowerShell executable not found. Install pwsh (recommended) or powershell.");
}

/**
 * Resolves the appropriate PowerShell script command for Windows
 * Checks for the existence of the script file and attempts to find a valid
 * PowerShell executable (pwsh or powershell)
 *
 * @param {string} name The name of the script to resolve (without extension)
 * @param {string[]} args Additional arguments to pass to the script
 * @returns {ScriptCommand} An object containing the command, arguments, and
 * script path to
 * execute
 * @throws Will throw an error if no PowerShell executable is found or if the
 * script cannot be found
 */
function resolveWindowsScript(name: string, args: string[]): ScriptCommand {
  const scriptPath = path.join(__dirname, "win", `${name}.ps1`);
  assertScriptExists(scriptPath, `No PowerShell script found for "${name}".`);

  const shell = resolvePowerShellShell();
  return {
    args: ["-NoProfile", "-ExecutionPolicy", "Bypass", "-File", scriptPath, ...args],
    command: shell,
    scriptPath,
  };
}

/**
 * Resolves the appropriate script command based on the current platform and
 * provided script name
 *
 * @param {string} name The name of the script to resolve (without extension)
 * @param {string[]} args Additional arguments to pass to the script
 * @returns {ScriptCommand} An object containing the command, arguments, and
 * script path to execute
 * @throws Will throw an error if the platform is unsupported or if the script
 * cannot be found
 */
function resolveScriptCommand(name: string, args: string[]): ScriptCommand {
  if (process.platform === "win32") {
    return resolveWindowsScript(name, args);
  } else if (UNIX_PLATFORMS.has(process.platform)) {
    return resolveUnixScript(name, args);
  }

  throw new Error(`Unsupported platform: ${process.platform}`);
}
