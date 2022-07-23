#!/bin/bash

nmap -p $1 -sV -sC $HTB_IP
