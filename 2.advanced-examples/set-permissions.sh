#!/bin/bash

# Define constants for permission types
BASIC_PERMISSION="basic"
MEDIUM_PERMISSION="medium"
ADVANCED_PERMISSION="advanced"

# Check if two arguments have been provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <permission_type> <file_path>"
  exit 1
fi

# Extract arguments into variables
permission_type=$1
file_path=$2

# Function to set basic permissions (read-only)
set_basic_permissions() {
  chmod 444 "$1"
}

# Function to set medium permissions (read and write)
set_medium_permissions() {
  chmod 664 "$1"
}

# Function to set advanced permissions (full ownership)
set_advanced_permissions() {
  chmod 700 "$1"
}

# Assign permissions based on the provided permission type
case $permission_type in
  $BASIC_PERMISSION)
    set_basic_permissions "$file_path"
    ;;
  $MEDIUM_PERMISSION)
    set_medium_permissions "$file_path"
    ;;
  $ADVANCED_PERMISSION)
    set_advanced_permissions "$file_path"
    ;;
  *)
    echo "Invalid permission type: $permission_type"
    exit 1
    ;;
esac

echo "Permissions set successfully for $file_path"
