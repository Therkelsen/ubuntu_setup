#!/bin/bash

if [ $# -ne 2 ] || [ $1 == "-h" ] || [ $1 == "--help" ]; then
    echo "Usage: ./connect.sh <connection_name> <interface_name>"
    echo "Interface name found by running ifconfig -a. Something containing enx."
    exit 1
fi

sudo nmcli connection add con-name $1 ifname $2 type ethernet
sudo nmcli dev set $2 managed yes

sudo mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf_orig 
sudo touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf

sudo systemctl restart NetworkManager

sudo nmcli con up $1

ping -c 1 google.com
if [$? -ne 0]; then
    echo "Connection failed"
fi

echo "Connection successfully established"
ifconfig -a | grep -E inet