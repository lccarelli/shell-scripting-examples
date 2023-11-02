#!/bin/bash

# system-monitoring-test.sh: Test script for system-monitoring.sh

# Constants
SYSTEM_MONITORING_SCRIPT="advanced-examples/system-monitoring.sh"

# Function to perform a test
perform_test() {
  local description=$1
  local command=$2
  local expected_exit_code=$3

  echo "Running test: $description"
  eval "$command"
  local exit_code=$?

  if [ $exit_code -eq $expected_exit_code ]; then
    echo "Test passed!"
  else
    echo "Test failed: Expected exit code $expected_exit_code, got $exit_code"
    exit 1
  fi
}

# Main test logic
echo "Starting tests..."

# Test system-monitoring.sh with various options
perform_test "Show CPU usage" "$SYSTEM_MONITORING_SCRIPT -c" 0
perform_test "Show memory usage" "$SYSTEM_MONITORING_SCRIPT -m" 0
perform_test "Show disk space" "$SYSTEM_MONITORING_SCRIPT -d" 0
perform_test "Show network activity" "$SYSTEM_MONITORING_SCRIPT -n" 0
perform_test "Show all system resources" "$SYSTEM_MONITORING_SCRIPT -a" 0
