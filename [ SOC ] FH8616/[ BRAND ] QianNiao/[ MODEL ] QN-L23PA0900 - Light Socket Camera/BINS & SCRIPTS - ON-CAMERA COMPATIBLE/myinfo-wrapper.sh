#!/bin/sh

# List of commands as a space-separated string ordered as in myinfo.sh
#commands="kernel_ver kernel_date sdk_ver wifi sensor sensor_width sensor_height \
#sensor1 sensor1_width sensor1_height sensor2 sensor2_width sensor2_height \
#soc ddr org_mac def_mac cur_mac sn eth0_ip def_ip magic product_no img_ver \
#brand model hw_id hw_name board_id def_hw_name dev_type os_mem vmm_mem \
#fw_ver build_date img_fw_ver target http_port https_port rtsp_port onvif_port \
#check_up prodid bootid flash ephy elink usb sdio"

# List of commands grouped by relevance
commands="\
brand model product_no prodid soc hw_id hw_name board_id flash sn def_hw_name dev_type \
kernel_ver kernel_date build_date fw_ver img_ver img_fw_ver sdk_ver bootid magic target \
os_mem vmm_mem ddr wifi sdio ephy elink eth0_ip def_ip org_mac def_mac cur_mac http_port \
https_port rtsp_port onvif_port sensor sensor_width sensor_height sensor1 sensor1_width \
sensor1_height sensor2 sensor2_width sensor2_height usb check_up"


# Loop through each command
for cmd in $commands; do
# Run the command and capture its output
output=$(/app/myinfo.sh "$cmd")
# Print the command name and its output
echo "$cmd: $output"
done
