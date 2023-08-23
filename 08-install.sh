#!/bin/bash

## Our goal is to install mysql
USERID=$(id -u)

if [  $USERID -ne 0 ] 
then 
    echo "ERROR:: Please run the script with root access"
    exit 1
else
    echo "INFO:: you are root user"
fi

## again it is our responcibility to thecheck the installtion success or not
yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: Installation of mysql is error"
    exit 1
else
    echo "INFO:: installation of mysql success"

fi 

yum install wget -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: installtion of wget is error"
else
    echo "INFO:: installation of wget is success"

fi