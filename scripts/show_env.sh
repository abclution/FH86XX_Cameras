#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
env_param="${3:-null}"
download=''
#echo "Reading Serail Number:"
#response=$(echo "<READSN></READSN>" | nc "$ip" "$port");
#echo "$response"
#echo "Reading environment variable $env_param:"
response=$(echo "<READENV>$env_param</READENV>" |nc "$ip" "$port");
echo "$response" |sed 's/>/ /g' |sed 's/</ /g' |awk '{print $2}'
#telnet $ip 
