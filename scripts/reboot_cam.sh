#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
new_password="${3:-root}"

echo "<SYSTEM> reboot </SYSTEM>" | nc "$ip" "$port" &
# echo "$response"
exit 0

