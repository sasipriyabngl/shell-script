#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shell-script
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run the script with root access"
    exit 1
else
    echo "INFO:: you are root user"
fi    

for i in $@
do
    yum list installed $i &>>$LOGFILE 
    if [ $? -ne 0 ]
    then
        echo  "$i is not installed, Lets install"
        yum install -y &>>$LOGFILE
    else
        echo -e  "$Y $i is Already installed $N"    
    
    VALIDATE $? "Installing $i"
done