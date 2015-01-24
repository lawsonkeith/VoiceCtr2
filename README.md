VoiceControl 2 readme
---------------------

Hardware
--------
*Relays controlled by	gpio# 15,18,23,24
*Google LED		gpio# 25
*Switch LED		gpio# 8
*Switch IP		gpio# 7

Mic and USB wifi used.

ULN2003A Darlington array used to:

1. Drive relays 1-4
2. Allow the pi to control the switch LED with +5V
3. Allow to pi to read the +5V switch

Sansmart 4 way relay board used; this uses active low inputs to drive the
relays.


Install
-------
Glone from git:
* https://github.com/StevenHickson/PiAUISuite
* https://github.com/lawsonkeith/VoiceCtrl2

* cd PiAUISuite/Install/
* sudo ./InstallAUISuite.sh

* sudo apt-get install vightvncserver
* sudo apt-get install avahi-daemon


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
