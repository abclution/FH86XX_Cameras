#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
new_password="${3:-root}"

response=$(echo "<SYSTEM>  ./light.sh INDICATOR_TEST_LIGHT </SYSTEM>" | nc "$ip" "$port");
echo "$response"
