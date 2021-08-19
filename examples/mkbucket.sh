#!/bin/sh

BUCKETNAME=$1

aws s3api create-bucket \
    --bucket $BUCKETNAME \
    --region ap-southeast-2 \
    --create-bucket-configuration LocationConstraint=ap-southeast-2
