#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg01.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
        --stack-name $Stack1Parameter \
        --template-body file://cf01.yaml \
	--parameters \
        ParameterKey=Stack1Parameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=CidrBlockParameter,ParameterValue=$CidrBlockParameter \
        ParameterKey=AZ1Parameter,ParameterValue=$AZ1Parameter \
        ParameterKey=CidrBlockPub1Parameter,ParameterValue=$CidrBlockPub1Parameter \
        ParameterKey=CidrBlockPri1Parameter,ParameterValue=$CidrBlockPri1Parameter \
        ParameterKey=AZ2Parameter,ParameterValue=$AZ2Parameter \
        ParameterKey=CidrBlockPub2Parameter,ParameterValue=$CidrBlockPub2Parameter \
        ParameterKey=CidrBlockPri2Parameter,ParameterValue=$CidrBlockPri2Parameter \
        ParameterKey=FlowlogBucketParameter,ParameterValue=$FlowlogBucketParameter \
        ParameterKey=FlowlogBucketARNParameter,ParameterValue=$FlowlogBucketARNParameter \
        --region $REGION \

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack1Parameter \
	--template-body file://cf01.yaml \
	--parameters \
        ParameterKey=Stack1Parameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=CidrBlockParameter,ParameterValue=$CidrBlockParameter \
        ParameterKey=AZ1Parameter,ParameterValue=$AZ1Parameter \
        ParameterKey=CidrBlockPub1Parameter,ParameterValue=$CidrBlockPub1Parameter \
        ParameterKey=CidrBlockPri1Parameter,ParameterValue=$CidrBlockPri1Parameter \
        ParameterKey=AZ2Parameter,ParameterValue=$AZ2Parameter \
        ParameterKey=CidrBlockPub2Parameter,ParameterValue=$CidrBlockPub2Parameter \
        ParameterKey=CidrBlockPri2Parameter,ParameterValue=$CidrBlockPri2Parameter \
        ParameterKey=FlowlogBucketParameter,ParameterValue=$FlowlogBucketParameter \
        ParameterKey=FlowlogBucketARNParameter,ParameterValue=$FlowlogBucketARNParameter \
	--region $REGION

elif [ $ACTION == 'delete' ]; then

  aws s3 rb s3://${FlowlogBucketParameter} --force  

  aws cloudformation delete-stack \
        --stack-name $Stack1Parameter \
        --region $REGION


else

	echo "Usage: sh cfg01.sh <create|update|delete>"

fi
