#!/bin/bash

# Show Progress percent for number of task
# Give total number of task as paramerter
# Eg: ShowProgressPercent 25
function ShowProgressPercent(){
    # First param is captured as number_of_task 
    number_of_task=$1

    for i in `seq 1 ${number_of_task}`;
    do
        # echo -n "$i"
        echo -n "$((${i}*100/${number_of_task})) %     "
        echo -n R | tr 'R' '\r'
        sleep 1
    done
}


# Very simple progress indicator
# Only indicates something is happening
# https://askubuntu.com/questions/623933/how-to-create-a-rotation-animation-using-shell-script
function progressIndicator(){
    chars="/-\|"

    while :; do
    for (( i=0; i<${#chars}; i++ )); do
        echo -en "${chars:$i:1}" "\r"
    done
    done
}

# Nice Spinner
Spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

ShowProgressPercent 10
progressIndicator
Spinner