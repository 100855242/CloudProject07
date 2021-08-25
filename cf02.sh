#!/bin/sh

source ./cfg.sh

if [ -z $ACTION ]; then

	echo "Usage: sh cfg02.sh <create|update|delete>"

elif [ $ACTION == 'create' ]; then

  aws cloudformation create-stack \
  --stack-name $Stack2Parameter \
  --template-body file://cf02.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=HostingBucketParameter,ParameterValue=$HostingBucketParameter \
        ParameterKey=HostingBucketARNParameter,ParameterValue=$HostingBucketARNParameter \
        ParameterKey=DomainNameParameter,ParameterValue=$DomainNameParameter \
        ParameterKey=CFHostedZoneIdParameter,ParameterValue=$CFHostedZoneIdParameter \
        ParameterKey=S3DNSNameParameter,ParameterValue=$S3DNSNameParameter \
        ParameterKey=WWWCertificateParameter,ParameterValue=$WWWCertificateArn \
  --region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'update' ]; then

  aws cloudformation update-stack \
	--stack-name $Stack2Parameter \
	--template-body file://cf02.yaml \
	--parameters \
        ParameterKey=VPCStackParameter,ParameterValue=$Stack1Parameter \
        ParameterKey=VPCRegionParameter,ParameterValue=$VPCRegionParameter \
        ParameterKey=HostingBucketParameter,ParameterValue=$HostingBucketParameter \
        ParameterKey=HostingBucketARNParameter,ParameterValue=$HostingBucketARNParameter \
        ParameterKey=DomainNameParameter,ParameterValue=$DomainNameParameter \
        ParameterKey=CFHostedZoneIdParameter,ParameterValue=$CFHostedZoneIdParameter \
        ParameterKey=S3DNSNameParameter,ParameterValue=$S3DNSNameParameter \
        ParameterKey=WWWCertificateParameter,ParameterValue=$WWWCertificateArn \
	--region $REGION \
	--capabilities CAPABILITY_NAMED_IAM

elif [ $ACTION == 'delete' ]; then

  aws s3 rb s3://${HostingBucketParameter} --force  

  aws cloudformation delete-stack \
        --stack-name $Stack2Parameter \
        --region $REGION

else

	echo "Usage: sh cfg02.sh <create|update|delete>"

fi
