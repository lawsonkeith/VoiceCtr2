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

                        "screen on" )   on_r1.sh
                                        ;;

                        "screen off" )  off_r1.sh
                                        ;;

                        "good bye" )    off_r1.sh
                                        off_r2.sh
                                        off_r3.sh
                                        off_r4.sh
                                        ;;

                        "hello" )       on_r1.sh
                                        on_r2.sh
                                        on_r3.sh
                                        on_r4.sh
                                        ;;

                         "monitor on" ) on_r2.sh
                                        ;;

                        "monitor off" ) off_r2.sh
                                        ;;

                        "laptop on" )   on_r3.sh
                                        ;;

                        "laptop off" )  off_r3.sh
                                        ;;

                        "light on" )    on_r4.sh
                                        ;;

                        "light off" )   off_r4.sh
                                        ;;

                # @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                esac
                #LED off again
                echo 0 > /sys/class/gpio/gpio8/value
        fi
done
