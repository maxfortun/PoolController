SWD=$(dirname ${BASH_SOURCE[0]})

. $SWD/pinGroup.sh

pinGroupSetPin FILTER_IN NORMAL 18
pinGroupSetPin FILTER_IN REVERSE 23

pinGroupSetPin FILTER_OUT NORMAL 24
pinGroupSetPin FILTER_OUT REVERSE 25

pinGroupSetPin PUMP POWER 12






