#!/bin/sh
# Modification of idump.sh that makes individual mtd backup files & full flash using dd.
# Also forces the default of writing to sd card. 
# Use --local for writing locally.
version=1.1
dst_img_name=Flash.img

if [ "$1" = "--version" ] ; then
        echo $version
        exit 0
fi

if [ "$1" = "--sd" ] || [ -z "${1}" ]; then
        if [ ! -d /mnt/sd ] ; then
                echo "no sd card found"
                exit 1
        fi
        dst=/mnt/sd/dd_img_dump/
        mkdir -p $dst
        
fi

if [ "$1" = "--local" ] ; then
        dst=/home/
        # Forced cleanup for writing local
        rm -f /home/Flash.img
        rm -f /home/mtd_*.img

fi

mtd_count=$(cat /proc/mtd | tail -n1 | awk -F: '{print substr($1, 4)}')
mtd_no=0
while [ $mtd_no -le $mtd_count ]
do
        if [ "$mtd_no" = 0 ] && [ -f  "$dst$dst_img_name" ] ; then
                echo "Forcing cleanup of $dst$dst_img_name."
                eval rm -f ${dst}*
        fi
        
        echo "Reading mtd$mtd_no and dumping to ${dst}mtd_$mtd_no.img"

        mtd_size=$(mtdt info /dev/mtd$mtd_no | awk '/mtd.size/{print $3}')

        # Individual sections of the MTD devs.
        dd if=/dev/mtd$mtd_no of=${dst}mtd_$mtd_no.img
       
        # Concatenate each pieces into the full image.
        /bin/cat ${dst}mtd_$mtd_no.img >> $dst$dst_img_name

        mtd_no=`expr $mtd_no + 1`
done

echo "Created full image dump using dd at $dst$dst_img_name"
