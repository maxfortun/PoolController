
declare -A PIN_GROUPS

function pinGroupSetPin() {
	local groupName=$1
	local pinName=$2
	local pinNumber=$3

	PIN_GROUPS[$groupName:$pinName]=$pinNumber
}

function pinGroupGetPin() {
	local groupName=$1
	local pinName=$2
	echo ${PIN_GROUPS[$groupName:$pinName]}
}

function pinGroupGetOtherPins() {
	local groupName=$1
	local pinName=$2

	pins=
	for pinId in ${!PIN_GROUPS[@]}; do
		if [[ "$pinId" =~ ^$groupName ]] && [ "$pinId" != "$groupName:$pinName" ]; then
				pins="$pins ${PIN_GROUPS[$pinId]}"
		fi
	done

	pins=${pins## }
	echo ${pins}
}

# pinGroupSetPin FILTER_IN NORMAL 1
# pinGroupSetPin FILTER_IN REVERSE 2
# pinGroupSetPin FILTER_IN NONE 3

# pinGroupGetPin FILTER_IN NORMAL
# pinGroupGetOtherPins FILTER_IN NORMAL

