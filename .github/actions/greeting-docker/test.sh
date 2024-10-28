#!/bin/bash

# ./github/actions/greeting-docker/test.sh: Tests the greeting-docker action.

# Define the expected output
EXPECTED_OUTPUT="Hello, World! Welcome to the action world."

# Run the Docker container and capture output
OUTPUT=$(docker run --rm -e INPUT_NAME="World" greeting-docker)

if [[ "$OUTPUT" == "$EXPECTED_OUTPUT" ]]; then
  echo "Test passed!"
  exit 0
else
  echo "Test failed!"
  echo "Expected: $EXPECTED_OUTPUT"
  echo "Got: $OUTPUT"
  exit 1
fi
