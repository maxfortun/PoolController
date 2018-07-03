#!/bin/bash

case "$1" in
	export|exp)
		[ -L "/sys/class/gpio/gpio$2" ] && exit 1
		echo "export $2" >&2
		echo "$2" > /sys/class/gpio/export
		while [ ! -w "/sys/class/gpio/gpio$2/direction" ]; do
			sleep 1
		done
		echo "exported $2" >&2
		
	;;

	unexport|unexp)
		[ ! -L "/sys/class/gpio/gpio$2" ] && exit 1
		echo "unexport $2" >&2
		echo "$2" > /sys/class/gpio/unexport

	;;

	direction|dir)
		[ ! -L "/sys/class/gpio/gpio$2" ] && exit 1
		cat "/sys/class/gpio/gpio$2/direction" | grep -q "$3" && exit
		echo "direction $2 $3" >&2
		echo "$3" > "/sys/class/gpio/gpio$2/direction"
	;;

	on)
		[ ! -L "/sys/class/gpio/gpio$2" ] && exit 1
		echo "on $2" >&2
		echo "0" > "/sys/class/gpio/gpio$2/value"
	;;

	off)
		[ ! -L "/sys/class/gpio/gpio$2" ] && exit 1
		echo "off $2" >&2
		echo "1" > "/sys/class/gpio/gpio$2/value"
	;;

	read)
		[ ! -L "/sys/class/gpio/gpio$2" ] && exit 1
		cat "/sys/class/gpio/gpio$2/value"
	;;

	*)
		echo "Usage: "
		echo "       $0 export <pin>"
		echo "       $0 unexport <pin>"
		echo "       $0 mode <pin> <in/out>"
		echo "       $0 on <pin>"
		echo "       $0 off <pin>"
		echo "       $0 read <pin>"
		exit
	;;
esac

