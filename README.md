# CloudProject07 - DotNetCore App

This repo contains a series of CloudFormation templates (YAML format) which could be run manually in the AWS Web Management console, but are designed to be run using the AWS CLI in "wrapper" shell scripts. Each template has a corresponding shell script.

The shell scripts must be run with one the following arguments (using cf01.sh as an example):

```
sh cf01.sh create
sh cf01.sh update
sh cf01.sh delete
```

## Pre-requisites

An SSH keypair must be created in EC2 in the appropriate region, and the private key saved to your local development machine. The key name must be included in ```cfg.sh``` (see below).

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

## References

* [Host ASP.NET Core on Linux with Nginx](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/linux-nginx?view=aspnetcore-5.0)
* [Tutorial: Host a RESTful API with CORS in Azure App Service](https://docs.microsoft.com/en-gb/azure/app-service/app-service-web-tutorial-rest-api)
* [dotnet-core-api](https://github.com/Azure-Samples/dotnet-core-api)
