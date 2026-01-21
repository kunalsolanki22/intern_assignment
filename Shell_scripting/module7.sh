#!/bin/bash

LOG_FILE="server.log"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found."
    exit 1
fi

echo "--- Log Report ---"

# 1. Count Total Errors using grep
error_count=$(grep -c "ERROR" "$LOG_FILE")
echo "Total Errors: $error_count"

# 2. Extract unique IP addresses using awk and uniq
echo "Unique IPs with Errors:"
grep "ERROR" "$LOG_FILE" | awk '{print $2}' | sort | uniq

# 3. Save a cleaned version (Remove empty lines) to a new file
sed '/^$/d' "$LOG_FILE" > cleaned_log.txt
echo "Cleaned log saved to cleaned_log.txt"
