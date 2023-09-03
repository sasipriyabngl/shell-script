#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3)
echo "escaped content: $BODY\n"
TEAM_NAME=$4
ALERT_TYPE=$5

### echo "all args: $@" 

FINAL_BODY=$(sed -e 's/TEAM_NAME/DEVOPS TEAM/g' -e 's/ALERT_TYPE/HIGH DISK USAGE/g' -e 's/BODY/MESSAGE/' template.html)

echo "$FINAL_BODY" | mail -s "$(echo -e "$SUBJECt\nContent-Type: text/html")" "$1"