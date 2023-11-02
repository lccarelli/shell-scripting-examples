#!/bin/bash

# automation_test.sh: Test script for automation.sh

# Import the functions from automation.sh
source advanced-examples/automation.sh

# Function to perform a test
perform_test() {
  local display_name=$1
  local description=$2
  local command=$3
  local expected_exit_code=$4

  echo "Running test: $display_name"
  echo "Description: $description"
  eval "$command"
  local exit_code=$?

  if [ $exit_code -eq $expected_exit_code ]; then
    echo "Test passed!"
  else
    echo "Test failed: Expected exit code $expected_exit_code, got $exit_code"
    exit 1
  fi
  echo "-----------------------------------------------------------------"
}

# Main test logic
echo "Starting tests..."

# Test download_file function with a valid URL
# This test checks if the download_file function can successfully download a file from a valid URL
perform_test "Valid URL Test" "Download file with valid URL" "download_file 'https://www.example.com' 'downloaded_file.txt'" 0

# Test download_file function with an invalid URL
# This test checks if the download_file function handles the scenario of an invalid URL correctly
perform_test "Invalid URL Test" "Download file with invalid URL" "download_file 'invalid_url' 'downloaded_file.txt'" 6

# Test download_file function with a non-existing file
# This test checks if the download_file function handles the scenario of trying to download a non-existing file
perform_test "Non-Existing File Test" "Download non-existing file" "download_file 'https://non-existing-domain.com/non-existing-file.txt' 'downloaded_file.txt'" 6
