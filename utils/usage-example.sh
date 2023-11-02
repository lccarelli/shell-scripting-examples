#!/bin/bash

source utils/logger.sh
source utils/array-utils.sh

# Ejemplo de uso de logger.sh
log_info "Este es un mensaje informativo"
log_warning "Este es un mensaje de advertencia"
log_error "Este es un mensaje de error"
DEBUG=true log_debug "Este es un mensaje de depuración"

# Ejemplo de uso de array-utils.sh
my_array=("apple" "banana" "cherry")
if array_contains "banana" "${my_array[@]}"; then
    log_info "El array contiene banana"
else
    log_error "El array no contiene banana"
fi

log_info "La longitud del array es $(array_length "${my_array[@]}")"

log_info "Los elementos del array son:"
array_print "${my_array[@]}"