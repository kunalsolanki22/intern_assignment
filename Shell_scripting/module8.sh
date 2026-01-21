#!/bin/bash

# Define an array of servers
SERVERS=("google.com" "github.com" "localhost" "invalid.server")

echo "Checking status for ${#SERVERS[@]} servers..."
echo "----------------------------------------"

# Loop through each server in the array
for server in "${SERVERS[@]}"; do
	# Start the 'if' block by executing the ping command.
	# -c 1: Sends only 1 packet so the script doesn't wait forever.
	# &> /dev/null: Sends both standard output and error messages to the "black hole" to keep the terminal clean.
	if ping -c 1 "$server" &> /dev/null; then
	    # If the exit status of ping is 0 (Success), the server is reachable.
	    status="Online"
	else
	    # If the exit status is non-zero (Failure), the server is unreachable.
	    status="Offline"
	fi

	# Print the final result to the user.
	# ${status^^}: The '^^' is a Bash shortcut that converts the string to ALL UPPERCASE.
	# Result example: Server: google.com -> Status: ONLINE
	echo "Server: $server -> Status: ${status^^}"
done

# Adding a new server to the array
SERVERS+=("new_node_05")
echo "----------------------------------------"
echo "Updated list: ${SERVERS[@]}"
