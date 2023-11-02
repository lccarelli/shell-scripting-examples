#!/bin/bash

# permissions file to test
chmod +x advanced-examples/script-template.sh

# Constants
SCRIPT_TO_TEST="advanced-examples/script-template.sh"

# Function to perform a test
perform_test() {
  local description=$1
  local command=$2
  local expected_output=$3
  local expected_exit_code=$4

  echo "Running test: $description"
  output=$(eval "$command")
  exit_code=$?

  if [ "$output" == "$expected_output" ] && [ $exit_code -eq $expected_exit_code ]; then
    echo "Test passed!"
  else
    echo "Test failed."
    echo "Expected output: $expected_output"
    echo "Actual output: $output"
    echo "Expected exit code: $expected_exit_code"
    echo "Actual exit code: $exit_code"
    exit 1
  fi
  echo "-----------------------------------------------------------------"
}

# Main test logic
echo "Starting tests..."

# Test the script with no options
perform_test "No options" "$SCRIPT_TO_TEST" "Script execution starts here." 0

# Test the script with the help option
perform_test "Help option" "$SCRIPT_TO_TEST -h" "Usage: script-template.sh [options]
Options:
  -h, --help      Display this help message.
  -v, --version   Display the script version." 0

# Test the script with the version option
perform_test "Version option" "$SCRIPT_TO_TEST -v" "script-template.sh version 1.0.0" 0

# Test the script with an unknown option
perform_test "Unknown option" "$SCRIPT_TO_TEST -x" "Unknown option: -x" 1

echo "All tests passed!"
