#!/bin/bash

array_contains() {
    local element
    for element in "${@:2}"; do
        if [ "$element" == "$1" ]; then
            return 0
        fi
    done
    return 1
}

array_length() {
    echo "$#"
}

array_print() {
    local element
    for element in "$@"; do
        echo "$element"
    done
}
