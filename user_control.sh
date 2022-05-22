#!/bin/bash

TIMETABLE_FILE="timetable.csv"

USER_NAME='alex'

function load_timetable() {

    local IFS=','
    local CNT=1

    echo $1

    [ ! -f $1 ] && { echo "$1 Not found"; exit 1; }

    while read mon tue wed thu fri sat sun 
    do
        if [ $CNT -eq 2 ]; then
            echo "Mon: $mon"
            echo "Tue: $tue"
            echo "Wed: $wed"
            echo "Thu: $thu"
            echo "Fri: $fri"
            echo "Sat: $sat"
            echo "Sun: $sun"
        else
            CNT=$(($CNT+1))
        fi
    done < $1
}

function lock_user() {
    usermod --expiredate 1 $USER_NAME
}

function unlock_user() {
    usermod --expiredate -1 $USER_NAME
}

function check_login_time() {

}

function write_log() {
    
}

###################################################
# Main code
# test

load_timetable $TIMETABLE_FILE

exit 0