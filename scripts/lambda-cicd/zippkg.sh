#!/bin/sh

BASEDIR="/home/ec2-user/environment"
PYV="3.7"

function build_venv() {
  python3 -m venv venv
  source venv/bin/activate
  python3 -m pip install --upgrade pip
  python3 -m pip install wheel
  python3 -m pip install pycrypto
  python3 -m pip install paramiko
  deactivate
}

cd $BASEDIR
build_venv
cd ${BASEDIR}/venv/lib/python${PYV}/site-packages
zip -r ${BASEDIR}/worker_function.zip .
cd ${BASEDIR}/venv/lib64/python${PYV}/site-packages
zip -g -r ${BASEDIR}/worker_function.zip .
cd ${BASEDIR}/CloudProject07/scripts/lambda-cicd
zip -g ${BASEDIR}/worker_function.zip worker_function.py
