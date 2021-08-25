[Contents](contents.md)

# Documentation: Pre-requisites

## AWS account

Access to an AWS account with programmatic access keys and the permissions necessary to perform all operations. Cloud9 instances are automatically provisioned with temporary access keys.

## Development machine

A device capable of running Bash shell scripts and the AWS CLI utility is required (ie. a Linux laptop/workstation or a Cloud9 instance)

## Registered domain

A registered domain is required in order to properly implement the infrastructure.

## EC2 keypair

An SSH keypair must be created in EC2 in the appropriate region, and the private key saved to your local development machine. The key name must be included in ```cfg.sh``` (see below).

## Configuration (cfg.sh)

Basic configuration values for all shell scripts must be provided in ```cfg.sh```. When first cloning this repo, copy ```cfg.sh-example``` to ```cfg.sh``` and provide the required values.

## Templates

| YAML | Contents |
| ---- | -------- |
| cf01.yaml | Create VPC with two public and two private subnets across two Availability zones. Also create Internet Gateway, route tables, NACLs, Security Groups, Flowlogs bucket and Flowlogs. |
| cf02.yaml | Create public S3 bucket configured to serve static files over HTTPS (ie. a "website"). |
| cf03.yaml | Create encrypted private S3 storage for scripts, files, keys etc. Required to configure automated processes and pipelines, etc. |
| cf04.yaml | Create web server instance. |
| cf05.yaml | Create encrypted EFS filestorage with mount targets in each private subnet. A Security Group protecting the mount targets is created in ```cf01.sh```. This template is optional (depends on final architecture requirements). It is intended to provide shared storage for web application files. |
| cf06.yaml | Create a Cloud9 management instance in the project VPC. |

## Scripts

**mk_nginx_ami.sh**: Create an AMI image from the instance created by template ```cf04.yaml```.

