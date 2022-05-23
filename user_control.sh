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

# 1. lock the account
function lock_user() {
    usermod --expiredate 1 $USER_NAME
}

# 2. shutdown PC
function power_down() {
    shutdown -h now
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
# 
# crontab every 5 mins
# echo "*/5 * * * * cd /root/workplace/user_control && /usr/bin/git pull" |crontab
# */5 * * * * cd /root/workplace/user_control && /usr/bin/git pull
#
#
# alexey@alexey-hp:~$ last |grep "May 22"
# alexey   pts/0        192.168.1.13     Sun May 22 19:07   still logged in
# alex     :0           :0               Sun May 22 15:41   still logged in
# reboot   system boot  5.13.0-41-generi Sun May 22 15:40   still running
# alexey   pts/0        192.168.1.13     Sun May 22 11:23 - 12:47  (01:24)
# alex     :0           :0               Sun May 22 09:56 - down   (02:51)
# reboot   system boot  5.13.0-41-generi Sun May 22 09:55 - 12:47  (02:52)
# last | grep \"`date +"%b %d"`\"

load_timetable $TIMETABLE_FILE

exit 0