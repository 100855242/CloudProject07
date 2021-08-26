#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg04.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
    --stack-name $Stack4Parameter \
    --template-body file://cf04.yaml \
	  --parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=NginxAZParameter,ParameterValue=$AZ1Parameter \
        ParameterKey=EC2KeyParameter,ParameterValue=$EC2KeyParameter \
        ParameterKey=SSHKeyParameter,ParameterValue=$SSHKey \
        ParameterKey=NginxTypeParameter,ParameterValue=$NginxTypeParameter \
    --region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack4Parameter \
	--template-body file://cf04.yaml \
	--parameters \
    ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
    ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
    ParameterKey=NginxAZParameter,ParameterValue=$AZ1Parameter \
    ParameterKey=EC2KeyParameter,ParameterValue=$EC2KeyParameter \
    ParameterKey=SSHKeyParameter,ParameterValue=$SSHKey \
    ParameterKey=NginxTypeParameter,ParameterValue=$NginxTypeParameter \
	--region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'delete' ]; then

  aws cloudformation delete-stack \
        --stack-name $Stack4Parameter \
        --region $REGION

else

	echo "Usage: sh cfg04.sh <create|update|delete>"

fi
