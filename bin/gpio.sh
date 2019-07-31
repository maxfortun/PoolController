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

	unexportall|unexpall)
		for pin in /sys/class/gpio/gpio[0-9]*; do
			pin=${pin##*/}
			pin=${pin##gpio}
			echo "unexport $pin" >&2
			echo "$pin" > /sys/class/gpio/unexport
		done
	;;

	direction|dir)
		[ ! -L "/sys/class/gpio/gpio$2" ] && exit 1
		cat "/sys/class/gpio/gpio$2/direction" | grep -q "$3" && exit
		echo "direction $2 $3" >&2
		echo "$3" > "/sys/class/gpio/gpio$2/direction"
	;;

	active|act)
		[ ! -L "/sys/class/gpio/gpio$2" ] && exit 1
		case "$3" in
			low|lo|l)
				value=1
			;;
			*)
				value=0
			;;
		esac
		cat "/sys/class/gpio/gpio$2/active_low" | grep -q "$value" && exit
		echo "active $2 $3" >&2
		echo "$value" > "/sys/class/gpio/gpio$2/active_low"
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
		echo "       $0 active <pin> <low/high>"
		echo "       $0 direction <pin> <in/out>"
		echo "       $0 on <pin>"
		echo "       $0 off <pin>"
		echo "       $0 read <pin>"
		exit
	;;
esac

