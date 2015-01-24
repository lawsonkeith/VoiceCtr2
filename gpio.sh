# intitalise the pi gpio
# K Lawson 2015

# RL OP 15,18,23,24
#
echo starting GPIO...
echo 15 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio15/direction  
echo 0 > /sys/class/gpio/gpio15/value
#
echo 18 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio18/direction  
echo 0 > /sys/class/gpio/gpio18/value
#
echo 23 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio23/direction  
echo 0 > /sys/class/gpio/gpio23/value
#
echo 24 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio24/direction  
echo 0 > /sys/class/gpio/gpio24/value

# LED google LED
echo 25 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio25/direction  
echo 0 > /sys/class/gpio/gpio25/value
# Switch LED
echo 8 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio8/direction  
echo 0 > /sys/class/gpio/gpio8/value
# Switch IP
echo 7 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio7/direction  
echo 1 > /sys/class/gpio/gpio7/active_low

