#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
if [ -z "$HTB_IP" ]
then
    echo "HTB_IP is empty"
    exit
fi

ports=$(nmap -p- --min-rate=1000 -T4 $HTB_IP | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)

echo -e "Available ports:"
echo $ports
read -p "enumerate? " prompt

if [ "$prompt" = "y" ];then
	nmap -p $ports -sV -sC $HTB_IP
else
	exit
fi


