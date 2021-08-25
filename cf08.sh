#!/bin/sh

source ./cfg.sh

aws cloudformation create-stack \
  --stack-name Certificates \
  --region us-east-1 \
  --template-body file://cf08.yaml \
  --parameters \
  ParameterKey=DomainNameParameter,ParameterValue=$DomainName \
  ParameterKey=HostedZoneIdParameter,ParameterValue=$HostedZoneId
