#!/bin/bash

log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

log_warning() {
    echo -e "\e[33m[WARNING]\e[0m $1" >&2
}

log_error() {
    echo -e "\e[31m[ERROR]\e[0m $1" >&2
}

log_debug() {
    if [ "$DEBUG" = "true" ]; then
        echo -e "\e[34m[DEBUG]\e[0m $1"
    fi
}
