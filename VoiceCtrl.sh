case  "$1" in
start)
	HOME="/home/pi"
	echo "Starting VoiceCtrl..."
	echo $HOME
	/home/pi/VoiceCtrl/ping.sh &
	/home/pi/VoiceCtrl/voicecommand -c &
	;;
stop)
	echo "Stopping VoiceCtrl..."
	pkill ping
	pkill voicecommand
	;;
*)
	exit 1
	;;
esac
exit 0
