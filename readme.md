user timing control
test

Crontab
root@alexey-hp:~/workplace/user_control# crontab -l
*/5 * * * * cd /root/workplace/user_control && /usr/bin/git pull
# lock user
0 21 * * * usermod --expiredate 1
1 21 * * * shutdown -H -P 0
#
@reboot /root/workplace/user_control/user_control.sh

#########
root@alexey-hp:~/workplace/user_control# crontab -l
*/5 * * * * cd /root/workplace/user_control && /usr/bin/git pull
# lock user
0 21 * * * usermod --expiredate 1
1 21 * * * shutdown -H -P 0
#
@reboot /root/workplace/user_control/user_control.sh
#
*/5 * * * * /root/workplace/user_control/ip_check.sh

### Check time
if [ `date +"%H%M"` -gt 1415 ]; 
    then 
    echo "greater";
else 
    echo "less";
fi
