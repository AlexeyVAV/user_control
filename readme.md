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
