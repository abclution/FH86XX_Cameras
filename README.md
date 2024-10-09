wiki/From-Zero-to-Hero-in-5-minswiki/From-Zero-to-Hero-in-5-mins# FH86XX_Cameras
All I know about these low cost cameras. 

This repo applies to those specific cameras. 

It may work with other similar cameras, but be aware there are a lot of very similar looking cameras, and not all of them are FH86XX based.

In fact I have a couple of other nearly identical looking devices that are possibly A9 variants, and they are not remotely similar in terms of the underlying hardware.

The FH86XX cameras run Linux/Busybox, but I'm pretty certain the A9 ones don't. I haven't really probed the non FH86XX ones, I'll try to hack them next, so I may be proven wrong. 

First,  a little background information.

I picked up a couple of low cost  FH8616  based "Inteligent Cameras" 

You can find these for not much on AliExpress, with a search string of something like..

"8MP Wifi IP Outdoor Wireless Security Surveillance PTZ Camera 4X Zoom Cameras AI Human Tracking Two-way Audio HD Night Color Cam"

At the time of writing, expect to pay less than ten US dollars for them, with free shipping from AliExpress. At that price, I though them worth the gamble. 

This listing description is a bit of a stretch since the camera sensor in the one I am looking at currently is a 2MP sensor, but what the heck do you expect for the price. 

The code on the camera does support a bunch of sensors, and there may indeed be an 8MP version of the camera, but be aware, they are cheap for a reason. 

The AliExpress listings also typically claim "IP66 waterproof rating", but "waterproof" in this case would only apply if you put the device under an umbrella, in the middle of the Sahara. 

Use them in a weatherproof enclosure or indoors. 

The model I have has firware FH8616_IPC_V1.0.0_20230815 on it, but I suspect there are dozens of variants. 

On the plus side, it does "AI" motion detection, and has two motor axis control, and a pair of probably fake wifi antennae. 
.. oh and some very bright LEDs, and some IR LEDs too.. not bad for a few bucks. 

Check the wiki for more. 

https://github.com/pingumacpenguin/FH86XX_Cameras/wiki

Here on the wiki is a root exploit that should get you telnet root access. The Wiki explains how to not only get root access, but also connect to the rtsp streams and enable and connect to the ONVIF service for stream info and PTZ control. 

There are a few other related scripts in the repo. Feel free to download and try them. Some, all or none of them may work with your camera. 

https://github.com/pingumacpenguin/FH86XX_Cameras/wiki/From-Zero-to-Hero-in-5-mins

Take care, as you can now break stuff...

Message me here with a pull request or an issue if you want to contribute. 

Don't expect an instant response as the day job takes up most of my time. 

