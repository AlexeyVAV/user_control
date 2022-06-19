#!/bin/bash
# readme

TIMETABLE_FILE="timetable.csv"

USER_NAME='alex'

### Main code ###
if [ -f logs/`date +"%Y-%m-%d"`.log ]
then 
    echo "exists"
else 
    echo "don't"
    usermod --expiredate -1 $USER_NAME
    touch `logs/date +"%Y-%m-%d"`.log
fi

exit 0