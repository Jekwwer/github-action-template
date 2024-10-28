#!/bin/bash

# ./github/actions/greeting-docker/entrypoint.sh:
# Echoes a greeting message to the console.

name="${INPUT_NAME}"
greeting="Hello, ${name}! Welcome to the action world."

echo "${greeting}"

# Set the output
echo "::set-output name=greeting::$greeting"
