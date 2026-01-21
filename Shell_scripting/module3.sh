#!/bin/bash

# Asking for input
echo "What is your name?"
read user_name

# Using the variable with a $ sign
echo "Hello $user_name!"

echo ""

read -p "Enter first number: " num1
read -p "Enter second number: " num2

# Calculation
sum=$((num1 + num2))
diff=$((num1-num2))
mult=$((num1*num2))
div=$((num1/num2))
mod=$((num1%num2))

echo "The total is: $sum"
echo "The difference is: $diff"
echo "The product  is: $mult"
echo "The quotient is: $div"
echo "The modulus is: $mod"
