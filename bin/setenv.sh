SWD=$(dirname ${BASH_SOURCE[0]})

. $SWD/pinGroup.sh

pinGroupSetPin PUMP POWER 17

pinGroupSetPin FILTER_IN NORMAL 27
pinGroupSetPin FILTER_IN REVERSE 22

pinGroupSetPin FILTER_OUT NORMAL 5
pinGroupSetPin FILTER_OUT REVERSE 6







