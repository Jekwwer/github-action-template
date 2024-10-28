// .github/actions/greeting-js/index.cjs: Greets the user with a message.

const core = require("@actions/core");

function greet(name) {
  const greeting = `Hello, ${name}! Welcome to the action world.`;
  console.log(greeting);
  core.setOutput("greeting", greeting);
  return greeting;
}

// Export greet only if running in a test environment
if (process.env.NODE_ENV === "test") {
  module.exports = greet;
}

// Run the greet function with the input provided
const name = core.getInput("name");
greet(name);
