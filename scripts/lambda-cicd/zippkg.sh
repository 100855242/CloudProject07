#!/bin/sh

PWD="/home/sysadmin/Documents/github/cicd-private/lambda"
PYV="3.6"

function build_venv() {
  python3 -m venv venv
  source venv/bin/activate
  python3 -m pip install --upgrade pip
  python3 -m pip install wheel
  python3 -m pip install pycrypto
  python3 -m pip install paramiko
}


cd ${PWD}/venv/lib/python${PYV}/site-packages
zip -r ${PWD}/worker_function.zip .
cd ${PWD}/venv/lib64/python${PYV}/site-packages
zip -g -r ${PWD}/worker_function.zip .
cd ${PWD}
zip -g worker_function.zip worker_function.py
