#!/bin/bash

function flash_led {
	COUNTER=0
	while [  $COUNTER -lt $1 ]; do
		echo 1 > /sys/class/leds/led$3/brightness
		sleep  $2
		echo 0 > /sys/class/leds/led$3/brightness
		sleep $2
		let COUNTER=COUNTER+1 
	done
}

# remember original LED settings
green=$(cat "/sys/class/leds/led0/trigger") 
red=$(cat "/sys/class/leds/led1/trigger") 

# take over control
echo gpio > /sys/class/leds/led0/trigger
echo gpio > /sys/class/leds/led1/trigger

# flash according to block settings
flash_led $1 0.1 0
flash_led $2 0.1 0

# restore original settings
echo $green > /sys/class/leds/led0/trigger
echo $red > /sys/class/leds/led1/trigger