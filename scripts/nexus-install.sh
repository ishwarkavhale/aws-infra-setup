#!/bin/bash

# Update system packages
sudo yum update -y

# Install Java 8
sudo yum install -y java-1.8.0-amazon-corretto

# Create nexus user
sudo useradd -M -s /sbin/nologin nexus

# Download and install Nexus
sudo mkdir -p /opt/nexus
cd /opt/nexus
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
sudo tar -xvf latest-unix.tar.gz
sudo rm latest-unix.tar.gz
sudo mv nexus-3* nexus
sudo mv sonatype-work nexusdata

# Set permissions
sudo chown -R nexus:nexus /opt/nexus

# Create systemd service
cat << EOF | sudo tee /etc/systemd/system/nexus.service
[Unit]
Description=Nexus service
After=network.target

[Service]
Type=forking
ExecStart=/opt/nexus/nexus/bin/nexus start
ExecStop=/opt/nexus/nexus/bin/nexus stop
User=nexus
Group=nexus
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Start Nexus service
sudo systemctl daemon-reload
sudo systemctl enable nexus
sudo systemctl start nexus