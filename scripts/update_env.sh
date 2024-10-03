#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
env_param="${3:-null}"

response=$(echo "<WRITEENV>$3</WRITEENV>" | nc "$ip" "$port");
echo "$response"
#telnet $ip 
