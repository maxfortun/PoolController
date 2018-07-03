SWD=$(dirname ${BASH_SOURCE[0]})

. $SWD/pinGroup.sh

pinGroupSetPin FILTER_IN NORMAL 1
pinGroupSetPin FILTER_IN REVERSE 2

pinGroupSetPin FILTER_OUT NORMAL 3
pinGroupSetPin FILTER_OUT REVERSE 4

pinGroupSetPin PUMP POWER 5






