#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
new_password="${3:-root}"

response=$(echo "<SYSTEM> /app/abin/playaudio /app/res/wav/alarm.aac </SYSTEM>" | nc "$ip" "$port");
echo "$response"
