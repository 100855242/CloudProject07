[Contents](contents.md)

# Documentation: Introduction

This project consists of a series of CloudFormation templates (YAML format) which provide a reference architecture for the secure, highly-available deployment of a modern distributed web application consisting of a Javascript framework "front-end" and an API "back-end". 

In this case, the Javascript framework is Angular and the API is implemented in .Net core, but the architecture itself should be easily adaptable to any similar technology stack.

The general principles of distributed web application development that the project aims to exemplify are described in the [CloudArchitecture](https://github.com/mjhalldotorg/CloudArchitecture) repo. 

The CloudFormation templates could be deployed manually in the AWS Web Management console, but have been designed to be deployed using shell script wrappers around AWS CLI commands. Each template has a corresponding shell script. The extra initial work involved in this approach is quickly regained with the speed and ease that infrastructure can be deployed, modified and deleted.

## Repo structure

| Item           | Contents |
| -------------- | -------- |
| cfg.sh-example | Configuration file template |
| cfXX.sh        | Shell script wrappers for manageing CloudFormation templates |
| cfXX.yaml      | CloudForamation templates in YAML format |
| docs           | Documentation |
| files          | Configuration files, eg. web server and system service configuration |
| scripts        | Shell scripts for performing various admin tasks |
