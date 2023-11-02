#!/bin/bash

# permissions file to test
chmod +x intermediate-examples/arithmetic-calculator.sh

# test
test_calculate() {
  # local x=$1 to local expected_quotient=$6: These lines define local 
  # variables within the function, assigning them the values of the arguments 
  #passed to the function. $1 to $6 are the function's arguments.
  local x=$1
  local y=$2
  local expected_sum=$3
  local expected_difference=$4
  local expected_product=$5
  local expected_quotient=$6

  # input
  # This line sends two numbers ($x and $y) as input to the 
  # arithmetic-calculator.sh script and saves the output in the output variable.
  output=$(echo -e "$x\n$y" | intermediate-examples/arithmetic-calculator.sh)

  # validate output
  # This line uses the read command to read the output variable and assign it 
  # to an array lines. IFS=$'\n' sets the internal field separator to a 
  # newline, ensuring that each line of output is assigned to a different 
  # element in the array.
  IFS=$'\n' read -d '' -r -a lines <<< "$output"
  # This if control structure compares the values in the lines array with the
  # expected results.
  # example lines = 15 5 50 2
  echo "array lines   ->[0]:${lines[0]},[1]:${lines[1]},[2]:${lines[2]},[3]:${lines[3]}"
  echo "array expect  ->[0]:$expected_sum,[1]:$expected_difference,[2]:$expected_product,[3]:$expected_quotient"
  
  if [ "${lines[0]}" = "$expected_sum" ] && [ "${lines[1]}" = "$expected_difference" ] && [ "${lines[2]}" = "$expected_product" ] && [ "${lines[3]}" = "$expected_quotient" ]; 
  then
    #happy path
    echo "Test passed for input X=$x, Y=$y"
  else
    #error path
    echo "Test failed for input X=$x, Y=$y"
    echo "Expected: $expected_sum, $expected_difference, $expected_product, $expected_quotient"
    echo "Got: ${lines[0]}, ${lines[1]}, ${lines[2]}, ${lines[3]}"
  fi
}

#  proof
# These lines call the test_calculate function with different sets of
# arguments to perform the tests.
test_calculate 10 5 15 5 50 2
test_calculate -5 2 -3 -7 -10 -2
test_calculate 25 -5 20 30 -125 -5
