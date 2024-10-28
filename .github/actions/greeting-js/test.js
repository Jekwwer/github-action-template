// .github/actions/greeting-js/test.js: Tests the greeting-js action.

const path = require("path");

test("Greeting action outputs correct message", () => {
  const greet = require(path.join(__dirname, "index.cjs"));

  const name = "Evgenii";
  const expectedOutput = `Hello, ${name}! Welcome to the action world.`;

  const output = greet(name);

  expect(output).toBe(expectedOutput);
});
