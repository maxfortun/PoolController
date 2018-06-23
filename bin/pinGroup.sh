SWD=$(dirname ${BASH_SOURCE[0]})
  
. $SWD/hash.sh

function pinGroupSetPin() {
	local groupName=$1
	local pinName=$2
	local pinNumber=$3

	hashPut pins "${groupName}_$pinName" $pinNumber
}

function pinGroupGetPin() {
	local groupName=$1
	local pinName=$2

	echo hashGet pins "${groupName}_$pinName"
	hashGet pins "${groupName}_$pinName"
}

function pinGroupGetOtherPins() {
	local groupName=$1
	local pinName=$2

	pins=
	keys=$(hashKeys pins)
	for pinId in $keys; do
		if [[ "$pinId" =~ ^$groupName ]] && [ "$pinId" != "${groupName}_$pinName" ]; then
				pins="$pins $(hashGet pins $pinId)"
		fi
	done

	pins=${pins## }
	echo ${pins}
}

