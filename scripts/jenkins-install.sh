#!/bin/bash

# Update system packages
sudo yum update -y

# Install Java 11
sudo yum install -y java-11-amazon-corretto

# Add Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
sudo yum install -y jenkins

# Start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Print initial admin password
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword