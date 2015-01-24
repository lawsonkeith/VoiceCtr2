case  "$1" in
start)
	HOME="/home/pi"
	echo "Starting VoiceCtrl..."
	echo $HOME
	/home/pi/VoiceCtrl2/gpio.sh 
	/home/pi/VoiceCtrl2/ping.sh &
	/home/pi/VoiceCtrl2/VoiceCtrl.sh &
	;;
stop)
	echo "Stopping VoiceCtrl..."
	pkill ping.sh
	pkill VoiceCtrl.sh
	;;
*)
	exit 1
	;;
esac
exit 0
