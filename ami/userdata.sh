#!/bin/sh

# Dotnet versions (dotnet-sdk & aspnetcore-runtime): 2.1, 2.2, 3.0, 3.1, 5.0
DOTNET_VERSION="5.0"

# Update OS and install packages
yum update -y
yum install -y git amazon-efs-utils

# Install nginx web proxy server
amazon-linux-extras enable nginx1
yum clean metadata
yum install -y nginx

# Install netcore
rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
yum install aspnetcore-runtime-${DOTNET_VERSION}
yum install dotnet-sdk-${DOTNET_VERSION}

#dotnet tool install --global x
