#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

### echo "all args: $@" 

FINAL_BODY=$(sed -e 's/TEAM_NAME/DEVOPS TEAM/g' -e 's/ALERT_TYPE/HIGH DISK USAGE/g' -e 's/BODY/MESSAGE/' template.html)

echo "$FINAL_BODY" | mail -s "$2" "$1"