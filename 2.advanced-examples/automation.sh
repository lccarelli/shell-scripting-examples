#!/bin/bash

# automation.sh: Examples of automation scripts

# Function to download a file from the internet
download_file() {
  local url=$1
  local destination=$2
  
  echo "Downloading $url..."
  curl -f -o "$destination" "$url"
  local exit_code=$?
  
  if [ $exit_code -eq 0 ]; then
    echo "Download complete!"
  else
    echo "Download failed."
  fi
  
  return $exit_code
}

# Function to create a backup of a file
backup_file() {
  local file_path=$1
  
  if [ -f "$file_path" ]; then
    local backup_path="$file_path.bak"
    cp "$file_path" "$backup_path" && echo "Backup created at $backup_path" || echo "Backup failed."
    return $?
  else
    echo "The file $file_path does not exist."
    return 1
  fi
}

# Main script execution function
main() {
  echo "Automation Script Examples"
  download_file "http://example.com/file.txt" "downloaded_file.txt"
  backup_file "important_document.txt"
}

# Check if the script is being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
fi
