
# Internship Task Report

This is a step-by-step documentation on how I completed this task.

1. Install docker. (Hint: please use VMs for this.) Write a bash script for installing Docker on a Linux machine.

For VM I used UTM with Ubuntu installed.

- Opened terminal first then created a created a new directory named **intuji-devops-internship-challenge**.

 <img width="1385" height="197" alt="1 1" src="https://github.com/user-attachments/assets/ccbf11ca-9b2a-4dd0-8eee-76d181a5ccdb" />

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
    

2. Clone the GitHub repository
(https://github.com/silarhi/php-hello-world.git).

- To clone the given GitHub repo I copied the link and in the terminal I typed **git clone** and then paste the link and press enter.
- It started cloning the repo to my local directory.
- I then added the cloned repo file to my GitHub repo name **intuji-devops-internship-challenge**.
- And also created personal access token to use during git push origin.
- I also encountered an issue when push the cloned content to my repo. So I had to use rebase and then I could push to my repo.

2.1. Create your Dockerfile for building a docker image of the above application. Your docker image should run any web application (nginx, apache, httpd).

- I created a dockerfile inside the directory named **Dockerfile**.
- Then I wrote the content for the file. And logged in to Docker using **docker login**.
- Then I build a docker image. And it succeed.

2.2. Push your docker image to the docker hub.

- I then add the user in a group named **Docker**
- And pushed the image in the docker. 

## Dockerfile

```bash
# Base Image
FROM php:7.4-cli

#Install system dependencies and Composer
RUN apt-get update && apt-get install -y \
 unzip \
 git \ 
 zip \
 curl \
 && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory inside the container
WORKDIR /app

# Copy all files
COPY . .

# Install PHP dependencies
RUN composer install

# Run PHPUnit tests by default
CMD ["vendor/bin/phpunit", "--testdox"]

```

3. Create a docker-compose file for an application.
- Created a new file named **docker-compose.yml**.
- And build it using the command **docker-compose up --build**

## docker-composer.yml

```bash
version: '3.8'

services:
  php-app:
    build: .
    container_name: php-hello-test
    volumes:
      - .:/app
    working_dir: /app
    command: vendor/bin/phpunit --testdox


```


4. Install Jenkins. Install necessary plugins. Create a freestyle project for building a CI/CD pipeline for the above application which will build artifacts using a docker file directly from your GitHub repo.
- First I had created a script to install jenkins with Java version 11, but unfortunately jenkins didn't start. 
- Removed all the files and tried installing new jenkins from terminal but still having the same issue. 
- Then I tried installing Java version 17 and running but the issue remained. 
- Then I tried **sudo su - jenkins** I entered the jenkins user account when I tried to exit jenkins started working and it gave password to login to jenkins from **localhost:8080**.
- Then went to firefox browser and pasted the password and clicked continue.
- Then I installed the suggested plugins.
- Created a First Admin User.
- Landed in the home page of jenkins.
- Clicked on new items -> Entered the item name **intuji-devops-internship-challenge** -> selected freestyle project from project type.
- In build steps I chose Execute Shell and typed docker build -t php-hello-world.
- In Source Code Management I chose Git and paste the public repo link and clicked Save.
- Then I clicked Build Now and it started building and few minutes later the build was complete.

## install-jenkins.sh

```bash
# Update and install dependencies
sudo apt update
sudo apt install openjdk-11-jdk -y

# Add Jenkins repo and key
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
sudo apt install jenkins -y

# Start Jenkins and enable at boot
sudo systemctl start jenkins
sudo systemctl enable jenkins

```
