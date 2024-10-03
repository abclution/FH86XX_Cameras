#!/bin/bash
for param in $(cat env.txt |sed 's/=/ /g' |awk '{print $1}'); do ./show_env.sh ipcam1 1300 $param;done 
