VoiceControl 2
==============
Scripts for the raspberry pi to enable voice control of relays.  The
voice control is done using the google speech API.  A switch is used
to trigger the voice recognition and then relays can be controlled
to switch mains voltages.  The box can usse WIFI or a CAT5 connector
to enable it to do the recognition.  A green LED indicates when the unit
can see the cloud speech recignition service.

And there's a lot more room in the car.
![](https://github.com/lawsonkeith/VoiceCtrl2/photo.jpg)
And there's a lot more room in the car.
![image](https://github.com/lawsonkeith/CoiceCtrl2/raw/master/photo.JPG)
![Image](../blob/master/public_html/img/nokia.png?raw=true)


Hardware
--------
* Relays controlled by	gpio# 15,18,23,24
* Google LED		gpio# 25
* Switch LED		gpio# 8
* Switch IP		gpio# 7

Mic and USB wifi used.

ULN2003A Darlington array used to:

1. Drive relays 1-4
2. Allow the pi to control the switch LED with +5V
3. Allow to pi to read the +5V switch

Sansmart 4 way relay board used; this uses active low inputs to drive the
relays.

The green Google LED is fex via a 330R resistor; the +5V outgoing power to
the switch contacts and switch LED is protected using a 100ma PTC.


Install
-------
Glone from git:
* https://github.com/StevenHickson/PiAUISuite
* https://github.com/lawsonkeith/VoiceCtrl2

Then install...

* cd PiAUISuite/Install/
* sudo ./InstallAUISuite.sh
* cd ~/
* sudo apt-get install vightvncserver
* sudo apt-get install avahi-daemon


Files that need copying manually
-------------------------------

* VoiceCtrlInit.sh	/etc/init.d/
* on* /usr/bin/
* off* /usr/bin/


Mic setup cmds
-------------

Set thi mic p to 2/3 of max gain. The record commands can be used to check the levels.

* alsamixer
* arecord -D plughw:1,0 test.wav
* aplay test.wav

F6 te select device then go to F4 input.


Make it bootable
----------------
This makes the pi boot into the voice control app and runs the google check app on startup.

* cp VoiceCtrlInit.sh /etc/init.d/
* sudo chmod 755 /etc/init.d/VoiceCtrlInit.sh

* sudo update-rc.d VoiceCtrlInit.sh defaults
* then when you are done...
* sudo update-rc.d VoiceCtrlInit.sh remove


Remote desktop cmds
-------------------

* ssh pi@raspberrypi.local
* vncserver &
* vncviewer 192.168.1.8:2


gitcmds
-------

* echo "# VoiceCtr2" >> README.md
* git init
* git add README.md

* git status
* git add filename

* git commit -am "first commit"
* git remote -v
* git remote add origin https://github.com/lawsonkeith/VoiceCtr2.git
* git push -u origin master


Files
-----
* VoiceCtrlInit.sh	init script - runs the following 3 scripts:

* gpio.sh		initialises the kernel GPIO driver
* VoiceCtrl.sh		speech recognition controller, edit this to change cmds
* ping.sh		controls the google LED

* speech-recog.sh	script to handle conversion only

* off_btn.sh		scripts to control GPIO
* off_led.sh
* off_r1.sh
* off_r2.sh
* off_r3.sh
* off_r4.sh
* on_btn.sh
* on_led.sh
* on_r1.sh
* on_r2.sh
* on_r3.sh
* on_r4.sh

* README.md		Readme file

* /dev/shm/Recognition	Dump of last recognised speech for ssh debugging
