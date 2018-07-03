SWD=$(dirname ${BASH_SOURCE[0]})
  
. $SWD/hash.sh
. $SWD/pinControl.sh

function pinGroupSetPin() {
	local groupName=$1
	local pinName=$2
	local pinNumber=$3

	hashPut pins "${groupName}_$pinName" $pinNumber
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
	pinOff $pin
}

function pinGroupPinOn() {
	local groupName=$1
	local pinName=$2

	otherPins=$(pinGroupGetOtherPins $groupName $pinName)

	for pin in $otherPins; do
		pinOff $pin
	done

	pin=$(pinGroupGetPin $groupName $pinName)
	pinOn $pin
}

