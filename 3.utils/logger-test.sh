#!/bin/bash

source utils/logger.sh

echo "Testing logger.sh"
log_info "This is an info message"
log_warning "This is a warning message"
log_error "This is an error message"
DEBUG=true log_debug "This is a debug message (should appear)"
DEBUG=false log_debug "This is a debug message (should NOT appear)"
