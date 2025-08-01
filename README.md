
# Internship Task Report

This is a step-by-step documentation on how I completed this task.

1. Install docker. (Hint: please use VMs for this.) Write a bash script for installing Docker on a Linux machine.

For VM I used UTM with Ubuntu installed.

- Opened terminal first then created a created a new directory named **intuji-devops-internship-challenge**.
- Then entered the directory and created a new file called **install-docker.sh** and wrote a bash script to install the docker.
 - Then gave permission to make it executable. 
 - And then run the command to start installing.
 - Docker is installed successfully.



## Bash Script to install docker



```bash
#!/bin/bash

echo "Installing Docker on Ubuntu..."

# Updating system
sudo apt update -y && sudo apt upgrade -y

# Installing prerequisites
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release

# Adding Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adding Docker repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Installing Docker
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Enable Docker without sudo
sudo usermod -aG docker $USER

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# When Completed
docker --version && echo "Docker installed successfully!"

```
    
