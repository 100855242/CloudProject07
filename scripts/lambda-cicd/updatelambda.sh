#!/bin/sh

aws lambda update-function-code \
	--function-name CiCdWorker \
	--zip-file fileb://worker_function.zip
