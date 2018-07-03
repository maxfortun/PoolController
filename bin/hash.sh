function hashPut() {
	name=$1
	key=$2
	value=$3

	ref=hash_${name}_${key}

	export $ref=$value
}

function hashGet() {
	name=$1
	key=$2

	ref=hash_${name}_${key}

	value=${!ref}

	echo $value
}

function hashKeys() {
	name=$1

	ref=hash_${name}
	for key in ${!hash_*}; do
		[[ "$key" =~ ^hash_$name ]] || continue
		key=${key##hash_${name}_}
		keys="$keys$key "
	done
	echo "$keys"
}

