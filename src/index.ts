
import chalk from "chalk";

export function describe(name, f) {
  console.error(chalk.bold("Describe: ") + chalk.yellow.bold(name));
  f();
} // function

export function it(name, f) {

  try {
    f();
    console.error(chalk.bold("  - ") + chalk.green.bold("✓ " + name));
  } catch (err) {
    console.error(chalk.bold("  - ") + chalk.red.bold("✗ " + name));
    throw err;
  }
} // function

import { strict as assert } from "assert";
export { assert, chalk };