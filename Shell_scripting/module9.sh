#!/bin/bash

# Enable 'Exit on Error' and 'No Unset Variables'
set -e
set -u

LOG_FILE="backup.log"

# Function to log messages with timestamps
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Trap unexpected exits or interruptions
cleanup() {
    log_message "ERROR: Script interrupted or failed unexpectedly. Cleaning up..."
    exit 1
}
trap cleanup ERR SIGINT

# Main Logic
SOURCE_DIR="$HOME/Downloads/test"
BACKUP_DIR="$HOME/Downloads/Intern_assignment/Shell_scripting/backup"

log_message "Starting backup process..."

if [ -d "$SOURCE_DIR" ]; then
    cp -r "$SOURCE_DIR" "$BACKUP_DIR"
    log_message "SUCCESS: Backup completed."
else
    log_message "FAILURE: Source directory $SOURCE_DIR does not exist."
    exit 1
fi
