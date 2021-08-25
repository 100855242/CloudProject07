[Contents](contents.md)

# Documentation: Pre-requisites

## AWS account

Access to an AWS account with programmatic access keys and the permissions necessary to perform all operations. Cloud9 instances are automatically provisioned with temporary access keys.

## Development machine

A device capable of running Bash shell scripts and the AWS CLI utility is required (ie. a Linux laptop/workstation or a Cloud9 instance). Required software includes:

* awscli
* git

## Registered domain

A registered domain is required in order to properly implement the infrastructure.

## EC2 keypair

An SSH keypair must be created in EC2 in the appropriate region, and the private key saved to your local development machine. The key name must be included in ```cfg.sh``` (see below).

