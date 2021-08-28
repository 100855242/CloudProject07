#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg09.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
    --stack-name $Stack9Parameter \
    --template-body file://cf09.yaml \
    --parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
    --region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack9Parameter \
	--template-body file://cf09.yaml \
    --parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
	--region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'delete' ]; then

  aws cloudformation delete-stack \
        --stack-name $Stack9Parameter \
        --region $REGION

else

	echo "Usage: sh cfg09.sh <create|update|delete>"

fi
