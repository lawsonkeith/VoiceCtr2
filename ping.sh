#!/bin/bash

# shell script to light a LED if the pi can see google.
# ping google and check the file size of the ping to
# see if we can see google or not.
#
# K Lawson 2015
#
file=/dev/shm/goog
minimumsize=20
sleep 10
while true
do
	ping google.com -w4 -c3 1> $file 2>/dev/null

	actualsize=$(wc -c "$file" | cut -f 1 -d ' ')
	if [ $actualsize -ge $minimumsize ]; then
		echo 1 > /sys/class/gpio/gpio25/value
		#grtr can see google
	else
		echo 0 > /sys/class/gpio/gpio25/value
	fi
	sleep 3
done
#r
