#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

### echo "all args: $@" 

FINAL_BODY=$(sed -e 's/$4/DEVOPS TEAM/g' -e 's/$5/HIGH DISK USAGE/g' -e 's/$3/MESSAGE/' template.sh)

echo "$FINAL_BODY" | mail -s "$2" "$1"