#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg06.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
        --stack-name $Stack6Parameter \
        --template-body file://cf06.yaml \
	      --parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        --region $REGION

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack6Parameter \
	--template-body file://cf06.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
	--region $REGION

elif [ $ACTION == 'delete' ]; then

  aws cloudformation delete-stack \
        --stack-name $Stack6Parameter \
        --region $REGION

else

	echo "Usage: sh cfg06.sh <create|update|delete>"

fi
