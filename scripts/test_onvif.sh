#!/bin/bash
CAMERA_IP="${1:-ipcam1}"
ONVIF_PORT="${2:-6688}"
USERNAME="admin"
PASSWORD="admin123456"
#CAMERA_IP="192.168.7.4"
#ONVIF_PORT="6688"


result=$(curl -s --basic -u "$USERNAME:$PASSWORD" --header "Content-Type: application/soap+xml; charset=utf-8" \
     --data '<s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope">
                <s:Body>
                    <GetCapabilities xmlns="http://www.onvif.org/ver10/device/wsdl"/>
                </s:Body>
             </s:Envelope>' \
     "http://$CAMERA_IP:$ONVIF_PORT/onvif/device_service"\
)
# Spit out the results through xmllint
# You will may to install the relevant xmllint package for your distro.
echo "$result" |xmllint --format -

