#!/bin/bash

output=$(basic-examples/hello-world.sh)

if [ "$output" = "Hello, World!" ]; then
    echo "Test passed: Output is exactly 'Hello, World!'"
else
    echo "Test failed: Expected 'Hello, World!' but got '$output'"
fi
