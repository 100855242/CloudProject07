#!/bin/sh

cd venv/lib/python3.6/site-packages
zip -r /home/sysadmin/Documents/github/cicd-private/lambda/cicd_function.zip .
cd venv/lib64/python3.6/site-packages
zip -r /home/sysadmin/Documents/github/cicd-private/lambda/cicd_function.zip .
cd /home/sysadmin/Documents/github/cicd-private/lambda
zip -g cicd_function.zip worker_function.py

