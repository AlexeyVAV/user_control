#!/bin/bash
# readme

TIMETABLE_FILE="timetable.csv"

USER_NAME='test_user'

#WORK_DIR="/root/workplace/user_control"
WORK_DIR="/root/workspace/user_control"

### Main code ###
if [ -f $WORK_DIR/logs/`date +"%Y-%m-%d"`.log ]
then 
    echo "exists"
else 
    echo "don't"
    usermod --expiredate -1 $USER_NAME
    touch $WORK_DIR/logs/`date +"%Y-%m-%d"`.log
fi

exit 0
