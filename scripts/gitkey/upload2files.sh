#!/bin/sh

aws s3 cp ~/.ssh/id_rsa s3://nrmh.files/id_rsa --sse=aws:kms
