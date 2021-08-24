#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg03.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
        --stack-name $Stack3Parameter \
        --template-body file://cf03.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=FilesBucketParameter,ParameterValue=$FilesBucketParameter \
        ParameterKey=FilesBucketARNParameter,ParameterValue=$FilesBucketARNParameter \
        --region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack3Parameter \
	--template-body file://cf03.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=FilesBucketParameter,ParameterValue=$FilesBucketParameter \
        ParameterKey=FilesBucketARNParameter,ParameterValue=$FilesBucketARNParameter \
	--region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'delete' ]; then

  aws s3 rb s3://${FilesBucketParameter} --force  

  aws cloudformation delete-stack \
        --stack-name $Stack3Parameter \
        --region $REGION

else

	echo "Usage: sh cfg03.sh <create|update|delete>"

fi
