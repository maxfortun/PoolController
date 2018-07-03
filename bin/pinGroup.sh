SWD=$(dirname ${BASH_SOURCE[0]})
  
. $SWD/hash.sh

function pinGroupSetPin() {
	local groupName=$1
	local pinName=$2
	local pinNumber=$3
	local pinNumber=$3

	hashPut pins "${groupName}_$pinName" $pinNumber
	$SWD/gpio.sh exp $pinNumber
	$SWD/gpio.sh dir $pinNumber high
	$SWD/gpio.sh dir $pinNumber out
}

function pinGroupGetPin() {
	local groupName=$1
	local pinName=$2

	hashGet pins "${groupName}_$pinName"
}

function pinGroupGetOtherPins() {
	local groupName=$1
	local pinName=$2

	pins=
	keys=$(hashKeys pins)
	for pin in $keys; do
		if [[ "$pin" =~ ^$groupName ]] && [ "$pin" != "${groupName}_$pinName" ]; then
				pins="$pins $(hashGet pins $pin)"
		fi
	done

	pins=${pins## }
	echo ${pins}
}

function pinGroupPinOff() {
	local groupName=$1
	local pinName=$2

	pin=$(pinGroupGetPin $groupName $pinName)
	$SWD/gpio.sh off $pin 
}

function pinGroupPinOn() {
	local groupName=$1
	local pinName=$2

	otherPins=$(pinGroupGetOtherPins $groupName $pinName)

	for pin in $otherPins; do
		$SWD/gpio.sh off $pin
	done

	pin=$(pinGroupGetPin $groupName $pinName)
	$SWD/gpio.sh on $pin 
}

