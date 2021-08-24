#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg05.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
        --stack-name $Stack5Parameter \
        --template-body file://cf05.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=MountTarget1Parameter,ParameterValue=$MountTarget1Parameter \
        ParameterKey=MountTarget2Parameter,ParameterValue=$MountTarget2Parameter \
        --region $REGION

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack5Parameter \
	--template-body file://cf05.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=MountTarget1Parameter,ParameterValue=$MountTarget1Parameter \
        ParameterKey=MountTarget2Parameter,ParameterValue=$MountTarget2Parameter \
	--region $REGION

elif [ $ACTION == 'delete' ]; then

  aws cloudformation delete-stack \
        --stack-name $Stack5Parameter \
        --region $REGION

else

	echo "Usage: sh cfg02.sh <create|update|delete>"

fi
