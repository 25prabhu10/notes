//  ------------------------------------------------------------------------------------------------
//  Imports
//  ------------------------------------------------------------------------------------------------

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

//  ------------------------------------------------------------------------------------------------
//  Variable Declarations
//  ------------------------------------------------------------------------------------------------

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, "..");

const distPath = path.resolve(
  projectRoot,
  // oxlint-disable-next-line node/no-process-env
  process.argv.at(2) ?? process.env.DIST ?? "docs/.vitepress/dist"
);

const MAX_ATTEMPTS = 5;
const RETRY_DELAY_MS = 500;

//  ------------------------------------------------------------------------------------------------
//  Utility Functions
//  ------------------------------------------------------------------------------------------------

/**
 * Blocks the event loop for the given number of milliseconds.
 *
 * @param {number} ms The number of milliseconds to wait
 */
function sleepSync(ms: number): void {
  Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, ms);
}

/**
 * Removes the target directory in a single attempt.
 *
 * @param {string} target The absolute path of the directory to remove
 * @throws Will throw if the removal fails
 */
function removeOnce(target: string): void {
  fs.rmSync(target, {
    force: true,
    maxRetries: 3,
    recursive: true,
    retryDelay: RETRY_DELAY_MS,
  });
  console.info(`dist clean ok: ${path.relative(projectRoot, target)}`);
}

/**
 * Reports a failed attempt and backs off before the next retry.
 *
 * @param {number} attempt The attempt number that just failed
 * @param {unknown} error The error thrown by the failed attempt
 */
function reportRetry(attempt: number, error: unknown): void {
  console.warn(
    `dist clean retry ${attempt}/${MAX_ATTEMPTS}: ${error instanceof Error ? error.message : String(error)}`
  );
  sleepSync(RETRY_DELAY_MS * attempt);
}
/**
 * Removes the build output directory, retrying on transient filesystem
 * errors (e.g. ENOTEMPTY on ntfs3 mounts where recursive deletes are not
 * atomic and parallel Vite environments may race emptyOutDir).
 *
 * @param {string} target The absolute path of the directory to remove
 * @throws Will throw the last error if all attempts fail
 */
function cleanDist(target: string): void {
  if (!fs.existsSync(target)) {
    console.info(`dist clean ok (missing): ${path.relative(projectRoot, target)}`);
    return;
  }

  for (let attempt = 1; attempt <= MAX_ATTEMPTS; attempt += 1) {
    try {
      removeOnce(target);
      return;
    } catch (error) {
      if (attempt === MAX_ATTEMPTS) {
        throw error;
      }

      reportRetry(attempt, error);
    }
  }
}

//  ------------------------------------------------------------------------------------------------
//  Main Procedure
//  ------------------------------------------------------------------------------------------------

cleanDist(distPath);
