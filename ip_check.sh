#!/bin/bash

IP_ADDRESS='192.168.1.178'

if [ `ifconfig | grep $IP_ADDRESS | wc -l` -ne 1 ]
then
    echo "wrong IP"
    shutdown -H -P 0
else
    echo "correct IP"
fi

# ifconfig | grep 192.168.1.13 | wc -l