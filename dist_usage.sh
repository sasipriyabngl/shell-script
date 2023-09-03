#!/bin/bash

LOGFILE_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""

#IFS= means internal field separator is space
while IFS= read line
do 
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1) ### this command gives the usage in number for comparisio
    partition=$(echo $line | awk '{print $1}') ### this command gives us partition details
    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then 
        MESSAGE+="HIGH DISK USAGE on $partition: $usage\n"
    fi    
done <<< $DISK_USAGE 

echo "$message" | mail -s "HIGH DISK USAGE" sarojamarrivada@gmail.com

