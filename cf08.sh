#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg08.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
    --stack-name Certificates \
    --template-body file://cf08.yaml \
    --parameters \
    ParameterKey=DomainNameParameter,ParameterValue=$DomainName \
    ParameterKey=HostedZoneIdParameter,ParameterValue=$HostedZoneId \
    --region us-east-1
    
elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
    --stack-name Certificates \
    --template-body file://cf08.yaml \
    --parameters \
    ParameterKey=DomainNameParameter,ParameterValue=$DomainName \
    ParameterKey=HostedZoneIdParameter,ParameterValue=$HostedZoneId \
    --region us-east-1
    
elif [ $ACTION == 'delete' ]; then

  aws cloudformation delete-stack \
        --stack-name Certificates \
        --region us-east-1

else

	echo "Usage: sh cfg08.sh <create|update|delete>"

fi