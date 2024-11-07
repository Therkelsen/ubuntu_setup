#!/bin/bash

# add help command (wrong amount of args, or -h or --help)
if [ $# -ne 2 ] || [ $1 == "-h" ] || [ $1 == "--help" ]; then
    echo "Usage: ./connect.sh <connection_name> <interface_name>"
    echo "Interface name found by running ifconfig -a. Something containing enx."
    exit 1
fi

sudo nmcli connection add con-name $1 ifname $2 type ethernet
sudo nmcli dev set $2 managed yes

sudo mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf /usr/lib/NetworkManager/conf.d/1>
sudo touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf

sudo systemctl restart NetworkManager

sudo nmcli con up $1

echo " "
sudo nmcli connection show

echo " "
ping -c 1 google.com
if [ $? -ne 0 ]; then
    echo -e "\nConnection failed."
fi

echo -e "\nConnection successfully established."
echo -e "\nGrab your IP from here."
ifconfig -a | grep -E "inet" | grep -v "inet6" | grep -v "127.0.0.1"

echo -e "\nScript done"

