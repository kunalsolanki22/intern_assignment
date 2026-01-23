#!/bin/bash


SERVERS=("google.com" "github.com" "localhost" "invalid.server")

echo "Checking status for ${#SERVERS[@]} servers..."
echo "----------------------------------------"

for server in "${SERVERS[@]}"; do
	# Start the 'if' block by executing the ping command.
	# -c 1: Sends only 1 packet so the script doesn't wait forever.
	# &> /dev/null: Sends both standard output and error messages to the "black hole" to keep the terminal clean.
	if ping -c 1 "$server" &> /dev/null; then
	    status="Online"
	else
	    status="Offline"
	fi

	# ${status^^}: The '^^' is a Bash shortcut that converts the string to ALL UPPERCASE.s
	echo "Server: $server -> Status: ${status^^}"
done


SERVERS+=("new_node_05")
echo "----------------------------------------"
echo "Updated list: ${SERVERS[@]}"
