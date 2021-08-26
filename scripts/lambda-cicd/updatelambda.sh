#!/bin/sh

aws lambda update-function-code \
	--function-name CiCdWorker \
	--zip-file fileb://cicd_function.zip \
	--profile project001
