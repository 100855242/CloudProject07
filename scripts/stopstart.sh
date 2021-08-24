#!/bin/bash

source ../cfg.sh

IDS="$INSTANCE_NGINX $INSTANCE_CLOUD9"

if [ $ACTION == 'start' ]; then

  aws ec2 start-instances --instance-ids $IDS --region $REGION

elif [ $ACTION == 'stop' ]; then

  aws ec2 stop-instances --instance-ids $IDS --region $REGION

fi