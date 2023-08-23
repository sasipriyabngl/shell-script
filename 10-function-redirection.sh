#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

## this function should validate the previous command and inform user it is success 0r failure
VALIDATE(){
    ## $1=arguement1=$?
    if [ $1 -ne 0 ]
    then 
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"

    fi 
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: Please run this script with root access"
    exit 1
fi

yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing postfix"