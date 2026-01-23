#!/bin/bash


validate_input() {
    if [ -z "$1" ]; then
        echo "Error: Input cannot be empty!"
        exit 1
    fi
}


add_numbers() {
    local sum=$(( $1 + $2 ))
    echo "The result is: $sum"
}

# Main Script Execution
read -p "Enter first number: " n1
validate_input "$n1"

read -p "Enter second number: " n2
validate_input "$n2"

add_numbers "$n1" "$n2"
