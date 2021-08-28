#!/bin/sh

cd /home/ec2-user/environment

aws lambda update-function-code \
	--function-name LambdaWorkerFunction \
	--zip-file fileb://worker_function.zip
