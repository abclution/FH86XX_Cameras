## STOCK FIRMWARE ROOT PASSWORD (Untested)

root123


SOURCE: <https://4pda.to/forum/index.php?showtopic=928641&view=findpost&p=131579800>


## BLOCK INTERNET ACCESS BUT ALLOW LAN (MIKROTIK)

### `add action=drop chain=forward disabled=yes out-interface-list=WAN  src-mac-address=CAMERA-MAC-ADDRESS`

NOTE: The v360 Pro app still seems to work as long as the cameras were added to the app without internet being blocked


## FTP ENABLE

todo

## ON-CAMERA COMPATIBLE BINS⁄SCRIPTS

* flashdump.sh / flashdump_dd.sh

A modified copy of the idump.sh script that backs up the firmware into a Flash.img as well as each mtd area individually. flashdump_dd.sh does the same but using dd. Files created by each are identical but written to slightly different locations, defaulting to writing on the sd, use --local for writing to internal storage. 


* busybox / SD busybox.zip

SOURCE: <https://4pda.to/forum/index.php?showtopic=928641&view=findpost&p=81185843>

A busybox binary with additional functionality.


* filebrowser / linux-armv6-filebrowser.tar.gz

SOURCE: <https://github.com/filebrowser/filebrowser>


* rsync

SOURCE: I compiled it from source using the hints in this gist, <https://gist.github.com/noahp/98bc8b0341bb76894ea4e91439424bdb>

So far, since I have no ssh, I use the rsyncd daemon on the destination to send from the camera somewhere.


* myinfo-wrapper.sh

SOURCE: Wrote as a wrapper around the myinfo.sh script to create an all in one report as seen below in the “CAMERA DEVICE INFO REPORT”

## CAMERA DEVICE INFO REPORT

./myinfo-wrapper.sh (get this from the on-camera bins folder)

```brand: QianNiao
model: QN-L23PQ0900
product_no: 62100900
prodid: PYNWN-01
soc: FH8616
hw_id: QN-IPC-FH8616
hw_name: IPCamera
board_id: board_0908
flash: nor
sn: 00112233445566778899
def_hw_name: IPCamera
dev_type:
kernel_ver: Linux 4.9.129
kernel_date: 2023-11-22 22:56:09
build_date: 2023-12-19T19:20
fw_ver: 20231219.1909
img_ver: 900
img_fw_ver: 20231219.1909
sdk_ver: FH8616_IPC_V1.0.0_20230815
bootid:
magic: 2a4c4232
target: release
os_mem: 45M
vmm_mem: 19M
ddr: 64M
wifi: BCM4330,BCM6181
sdio: BCM4330
ephy: no eth0 found
cat: can't open '/sys/class/net/eth0/carrier': No such file or directory
elink: down
ifconfig: eth0: error fetching interface information: Device not found
eth0_ip:
def_ip: 192.168.1.203
org_mac: 10:20:30:40:50:60
def_mac: 10:20:30:40:50:60
cat: can't open '/sys/class/net/eth0/address': No such file or directory
cur_mac:
http_port: 80
https_port: 443
rtsp_port: 8554
onvif_port: 6688
sensor: gc2375_mipi
sensor_width: 1280
sensor_height: 720
sensor1:
sensor1_width:
sensor1_height:
sensor2:
sensor2_width:
sensor2_height:
usb: NONE
```


