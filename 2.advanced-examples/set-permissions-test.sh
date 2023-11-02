#!/bin/bash

# permissions file to test
chmod +x advanced-examples/set-permissions.sh

# Define the path to the permission setting script
PERMISSION_SCRIPT="advanced-examples/set-permissions.sh"

# Function to test setting basic permissions
test_basic_permissions() {
  local file_path=$1

  # Set basic permissions
  $PERMISSION_SCRIPT basic "$file_path"

  # Check the permissions
  local permissions
  permissions=$(stat -f "%p" "$file_path" | cut -c 4-6)
  if [ "$permissions" = "444" ]; then
    echo "Basic permissions test passed."
  else
    echo "Basic permissions test failed. Expected 444, got $permissions."
  fi
}

# Function to test setting medium permissions
test_medium_permissions() {
  local file_path=$1

  # Set medium permissions
  $PERMISSION_SCRIPT medium "$file_path"

  # Check the permissions
  local permissions
  permissions=$(stat -f "%p" "$file_path" | cut -c 4-6)
  if [ "$permissions" = "664" ]; then
    echo "Medium permissions test passed."
  else
    echo "Medium permissions test failed. Expected 664, got $permissions."
  fi
}

# Function to test setting advanced permissions
test_advanced_permissions() {
  local file_path=$1

  # Set advanced permissions
  $PERMISSION_SCRIPT advanced "$file_path"

  # Check the permissions
  local permissions
  permissions=$(stat -f "%p" "$file_path" | cut -c 4-6)
  if [ "$permissions" = "700" ]; then
    echo "Advanced permissions test passed."
  else
    echo "Advanced permissions test failed. Expected 700, got $permissions."
  fi
}

# Create a temporary file for testing
temp_file=$(mktemp)

# Run the tests
test_basic_permissions "$temp_file"
test_medium_permissions "$temp_file"
test_advanced_permissions "$temp_file"

# Clean up
rm "$temp_file"