#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg07.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
        --stack-name $Stack7Parameter \
        --template-body file://cf07.yaml \
	      --parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=AMIParameter,ParameterValue=$AMIParameter \
        ParameterKey=KeynameParameter,ParameterValue=$KeynameParameter \
        ParameterKey=CPUPolicyParameter,ParameterValue=$CPUPolicyParameter \
        --region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack7Parameter \
	--template-body file://cf07.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=AMIParameter,ParameterValue=$AMIParameter \
        ParameterKey=KeynameParameter,ParameterValue=$KeynameParameter \
        ParameterKey=CPUPolicyParameter,ParameterValue=$CPUPolicyParameter \
	--region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'delete' ]; then

  aws cloudformation delete-stack \
        --stack-name $Stack7Parameter \
        --region $REGION

else

	echo "Usage: sh cfg07.sh <create|update|delete>"

fi
