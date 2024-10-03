#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
env_param="${3:-null}"
download=''
echo "Reading Serail Number"
response=$(echo "<READSN>$download</READSN>" | nc "$ip" "$port");
echo "$response"
download="onvif"
response=$(echo "<READENV>$download</READENV>" |nc "$ip" "$port");
echo "$response"
#telnet $ip 
