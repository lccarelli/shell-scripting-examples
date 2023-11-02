#!/bin/bash

# Read two integers from the user
read -p "Enter the first integer (X): " x
read -p "Enter the second integer (Y): " y

# Check the constraints
if [ $x -lt -100 ] || [ $x -gt 100 ] || [ $y -lt -100 ] || [ $y -gt 100 ] || [ $y -eq 0 ]; then
  echo "Input constraints violated. Please ensure -100 <= X,Y <= 100 and Y != 0."
  exit 1
fi

# Calculate the sum, difference, product, and quotient
sum=$((x + y))
difference=$((x - y))
product=$((x * y))
quotient=$((x / y))

# Print the results
echo "$sum"
echo "$difference"
echo "$product"
echo "$quotient"