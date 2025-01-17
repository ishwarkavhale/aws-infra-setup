#!/bin/bash

# Update system packages
sudo yum update -y

# Install required packages
sudo yum install -y yum-utils

# Add HashiCorp repository
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

# Install Terraform
sudo yum install -y terraform

# Install additional tools
sudo yum install -y git