#!/bin/sh

aws s3 cp gitpull.sh s3://nrmh.files/gitpull.sh --sse=aws:kms
