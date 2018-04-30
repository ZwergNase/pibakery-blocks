#!/bin/bash

# take over control
echo gpio > /sys/class/leds/led0/trigger
echo gpio > /sys/class/leds/led1/trigger

# red off / green on 
echo 0 > /sys/class/leds/led0/brightness
echo 1 > /sys/class/leds/led1/brightness

# flash green
COUNTER=0
while [  $COUNTER -lt $1 ]; do
	echo 0 > /sys/class/leds/led1/brightness
	sleep  0.2
	echo 1 > /sys/class/leds/led1/brightness
	sleep 0.2
	let COUNTER=COUNTER+1 
done

# flash red
COUNTER=0
while [  $COUNTER -lt $2 ]; do
	echo 1 > /sys/class/leds/led0/brightness
	sleep  0.2
	echo 0 > /sys/class/leds/led0/brightness
	sleep 0.2
	let COUNTER=COUNTER+1 
done
