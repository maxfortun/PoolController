SWD=$(dirname ${BASH_SOURCE[0]})

. $SWD/pinGroup.sh

pinGroupSetPin FILTER_IN NORMAL 1
pinGroupSetPin FILTER_IN REVERSE 2
pinGroupSetPin FILTER_IN NONE 3

pinGroupGetPin FILTER_IN NORMAL
pinGroupGetOtherPins FILTER_IN NORMAL





