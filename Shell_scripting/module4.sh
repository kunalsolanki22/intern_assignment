#!/bin/bash

read -p "Enter the filename to check: " filename

# -e checks if file exists, -r checks if it is readable
if [ -e "$filename" ]; then
    if [ -r "$filename" ]; then
        echo "Success: $filename exists and is readable!"
        echo "Content preview:"
        head -n 3 "$filename"
    else
        echo "Error: $filename exists, but you don't have permission to read it."
    fi
else
    echo "Error: The file '$filename' does not exist."
fi
