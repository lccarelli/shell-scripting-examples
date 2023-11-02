#!/bin/bash

source utils/array-utils.sh

echo "Testing array-utils.sh"
test_array=("apple" "banana" "cherry")

# Test array_contains
if array_contains "banana" "${test_array[@]}"; then
    echo "array_contains test passed"
else
    echo "array_contains test failed"
fi

if array_contains "grape" "${test_array[@]}"; then
    echo "array_contains test failed"
else
    echo "array_contains test passed"
fi

# Test array_length
if [ "$(array_length "${test_array[@]}")" -eq 3 ]; then
    echo "array_length test passed"
else
    echo "array_length test failed"
fi

# Test array_print
echo "array_print test (should print apple, banana, cherry):"
array_print "${test_array[@]}"
