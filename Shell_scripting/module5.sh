#!/bin/bash
echo "Listing all files in the current directory:"

for file in *; do
    if [ -f "$file" ]; then
        echo "Found file: $file"
    fi
done

read -p "Countdown till number : " var

while [ $var -gt 0 ];do
	echo "$var..."
	sleep 1
	var=$((var-1))
done

echo "Done"
