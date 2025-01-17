#!/bin/bash

# Update system packages
sudo yum update -y

# Install Java 11
sudo yum install -y java-11-amazon-corretto

# Install required packages
sudo yum install -y unzip

# Create sonarqube user
sudo useradd -M -s /sbin/nologin sonarqube

# Download and install SonarQube
sudo mkdir -p /opt/sonarqube
cd /opt/sonarqube
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.1.69595.zip
sudo unzip sonarqube-9.9.1.69595.zip
sudo mv sonarqube-9.9.1.69595/* .
sudo rm -rf sonarqube-9.9.1.69595*

# Set permissions
sudo chown -R sonarqube:sonarqube /opt/sonarqube

# Configure system limits
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
echo "fs.file-max=65536" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Create systemd service
cat << EOF | sudo tee /etc/systemd/system/sonarqube.service
[Unit]
Description=SonarQube service
After=network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonarqube
Group=sonarqube
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Start SonarQube service
sudo systemctl daemon-reload
sudo systemctl enable sonarqube
sudo systemctl start sonarqube