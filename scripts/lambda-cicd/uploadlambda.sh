#!/bin/sh

aws s3 cp ~/environment/worker_function.zip s3://nrmh.files/worker_function.zip --sse=aws:kms
