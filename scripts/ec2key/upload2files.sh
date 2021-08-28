#!/bin/sh

S3PRIVATE="nrmh.files"
KEYNAME="testkey.pem"

aws s3 cp "/home/ec2-user/.ssh/${KEYNAME}" "s3://${S3PRIVATE}/${KEYNAME}" --sse=aws:kms
