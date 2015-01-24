#!/bin/bash
#
# VoiceCtr2 shell script controller.  2015 K Lawson
# When user presses a btn sample the mic and
# use google speech recognition to then execute
# a shell command.  The switch LED is illuminated
# during this process.
#
#
# read input, then switch
while true; do
	#read switch state
    	read val < /sys/class/gpio/gpio7/value
	if ((val == 1)); then
		#pressed switch, turn LED on
        	echo 1 > /sys/class/gpio/gpio8/value
		#get speech & truncate quotes
		Voice=$(/home/pi/VoiceCtrl2/speech-recog.sh | tr -d '"')
		echo $Voice
		#ssh debug 
		echo $Voice > /dev/shm/Recognition.txt
		# decision time...
		case $Voice in
		# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

 			"light on" ) 	on_r1.sh
					;;

 			"light off" ) 	off_r1.sh
					;;

 			"lighting on" )	off_r1.sh
					off_r2.sh
					off_r3.sh
					off_r4.sh
					;;

 			"lighting off" )on_r1.sh
					on_r2.sh
					on_r3.sh
					on_r4.sh
					;;

		# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		esac
		#LED off again
        	echo 0 > /sys/class/gpio/gpio8/value
	fi
done




