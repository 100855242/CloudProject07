#!/bin/sh

INSTANCEID=$1
REGION="ap-southeast-2"
DATE=$(date +%Y%m%d-%H%M%S)

aws ec2 stop-instances --instance-ids $INSTANCEID --region $REGION
aws ec2 wait instance-stopped --instance-ids $INSTANCEID --region $REGION

AMIIMAGE=$(aws ec2 create-image \
--description " Nginx AMI image" \
--instance-id $INSTANCEID \
--name "NginxAMI-$DATE" \
--tag-specifications "ResourceType=image,Tags=[{Key=Name,Value=NginxAMI-$DATE}]" \
--region $REGION \
--query "ImageId" \
--output text)

aws ec2 wait image-available --image-ids $AMIIMAGE

aws ec2 terminate-instances --instance-ids $INSTANCEID --region $REGION

echo $AMIIMAGE
