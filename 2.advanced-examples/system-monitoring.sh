#!/bin/bash

# system-monitoring.sh: Script for monitoring system resources.

# Description: This script provides information about various system resources
# such as CPU usage, memory usage, disk space, and network activity.
# Author: Your Name
# Date: YYYY-MM-DD

# Constants
SCRIPT_NAME=$(basename "$0")
VERSION="1.0.0"

# Functions

# Function to display CPU usage
show_cpu_usage() {
  echo "CPU Usage:"
  top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
  echo "--------------------------------"
}

# Function to display memory usage
show_memory_usage() {
  echo "Memory Usage:"
  free -h | grep -v + | awk '/Mem/{printf "used: %s/%s\n", $3,$2}'
  echo "--------------------------------"
}

# Function to display disk space
show_disk_space() {
  echo "Disk Space:"
  df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
  echo "--------------------------------"
}

# Function to display network activity
show_network_activity() {
  echo "Network Activity:"
  sar -n DEV 1 1 | grep Average | grep -v IFACE | awk '{print $2 " TX: " $6 " RX: " $5}'
  echo "--------------------------------"
}

# Function to display script usage
usage() {
  echo "Usage: $SCRIPT_NAME [options]"
  echo "Options:"
  echo "  -h, --help              Display this help message."
  echo "  -v, --version           Display the script version."
  echo "  -c, --cpu               Show CPU usage."
  echo "  -m, --memory            Show memory usage."
  echo "  -d, --disk              Show disk space."
  echo "  -n, --network           Show network activity."
  echo "  -a, --all               Show all system resources."
}

# Function to display the script version
version() {
  echo "$SCRIPT_NAME version $VERSION"
}

# Main script execution

# Check if there are no command-line options
if [ $# -eq 0 ]; then
  usage
  exit 1
fi

# Parse command-line options
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -h|--help) usage; exit 0 ;;
    -v|--version) version; exit 0 ;;
    -c|--cpu) show_cpu_usage; exit 0 ;;
    -m|--memory) show_memory_usage; exit 0 ;;
    -d|--disk) show_disk_space; exit 0 ;;
    -n|--network) show_network_activity; exit 0 ;;
    -a|--all)
      show_cpu_usage
      show_memory_usage
      show_disk_space
      show_network_activity
      exit 0
      ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done
