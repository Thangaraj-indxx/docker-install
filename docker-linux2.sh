#!/bin/bash

# Remove the incorrect Docker package
sudo yum remove docker wmdocker -y

# Install required packages for yum to use a repository over HTTPS
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Docker's official GPG key
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo rpm --import https://download.docker.com/linux/centos/gpg

# Update the yum package index
sudo yum makecache

# Install Docker
sudo yum install docker-ce docker-ce-cli containerd.io -y

# Start and enable the Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Check Docker service status
sudo systemctl status docker
