#!/bin/bash
# readme

TIMETABLE_FILE="timetable.csv"

USER_NAME='alex'

WORK_DIR="/root/workplace/user_control"

DEAD_TIME=2100

function lock_user() {
    usermod --expiredate 1 $USER_NAME
}

### Main Code ###
if [ `date +"%H%M"` -gt $DEAD_TIME ]; 
    then 
    echo "greater than Dead Time";
    lock_user $USER_NAME
    shutdown -H -P 0
else 
    echo "less than Dead Time";
fi

exit 0