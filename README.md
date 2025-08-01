
# Internship Task Report

This is a step-by-step documentation on how I completed this task.

1. Install docker. (Hint: please use VMs for this.) Write a bash script for installing Docker on a Linux machine.

For VM I used UTM with Ubuntu installed.

- Opened terminal first then created a created a new directory named **intuji-devops-internship-challenge**.

 <img width="1385" height="197" alt="1 1" src="https://github.com/user-attachments/assets/ccbf11ca-9b2a-4dd0-8eee-76d181a5ccdb" />

- Then entered the directory and created a new file called **install-docker.sh** and wrote a bash script to install the docker.

 <img width="1393" height="883" alt="1 2" src="https://github.com/user-attachments/assets/aae817b4-3f89-4902-87e6-848eb7df822f" />

 - Then gave permission to make it executable.

   <img width="1395" height="203" alt="1 3" src="https://github.com/user-attachments/assets/43635444-c6d5-4f83-8c32-36a61224a1ca" />

 - And then run the command to start installing.
   
   <img width="1396" height="883" alt="1 4" src="https://github.com/user-attachments/assets/8981debe-e0ef-4421-b7a3-14b2f282dcd3" />

 - Docker is installed successfully.

<img width="1405" height="187" alt="1 5" src="https://github.com/user-attachments/assets/f427d18b-533a-4cc8-9350-7852e549c753" />



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

  <img width="1399" height="253" alt="2 1" src="https://github.com/user-attachments/assets/ea997067-9890-4090-a4a6-d5a0129a3e9a" />

- It started cloning the repo to my local directory.
- I then added the cloned repo file to my GitHub repo name **intuji-devops-internship-challenge**.

  <img width="1393" height="164" alt="2 2" src="https://github.com/user-attachments/assets/1ec46a85-c22b-4b3f-911f-9b678adb32b1" />

- And also created personal access token to use during git push origin.

  <img width="1365" height="608" alt="2 3" src="https://github.com/user-attachments/assets/4ebdac99-d6ec-4b82-8002-3f39b397c287" />

- I also encountered an issue when push the cloned content to my repo. So I had to use rebase and then I could push to my repo.
<img width="1325" height="355" alt="2 4" src="https://github.com/user-attachments/assets/227d2f44-85bd-47ca-af2b-3eb525742a8a" />
<img width="1129" height="653" alt="2 5" src="https://github.com/user-attachments/assets/b3ba4855-5f4d-4b21-a21c-8fa12d8f6e07" />


2.1. Create your Dockerfile for building a docker image of the above application. Your docker image should run any web application (nginx, apache, httpd).

- I created a dockerfile inside the directory named **Dockerfile**.
  <img width="1397" height="790" alt="2 1 1" src="https://github.com/user-attachments/assets/97ee3f53-96ff-4d9b-9472-92dd9aa1cec1" />

- Then I wrote the content for the file. And logged in to Docker using **docker login**.
  <img width="1396" height="692" alt="2 1 2" src="https://github.com/user-attachments/assets/aa9e4aac-a901-490c-a66e-352bd5f9d5df" />

- Then I build a docker image. And it succeed.
<img width="1403" height="573" alt="2 1 3" src="https://github.com/user-attachments/assets/05ffb674-f0dd-48e6-bcbc-887f37138b97" />


2.2. Push your docker image to the docker hub.

- I then add the user in a group named **Docker**
  <img width="1178" height="136" alt="2 2 1" src="https://github.com/user-attachments/assets/e9b6a673-1bdb-47f9-bc5a-62ede56d4660" />

- And pushed the image in the docker.
  <img width="1406" height="490" alt="2 2 2" src="https://github.com/user-attachments/assets/ca1da151-d866-4dc8-aff8-e7a8a765c99e" />
  <img width="1406" height="889" alt="2 2 3" src="https://github.com/user-attachments/assets/9eca8bdc-8a7f-4427-bbb5-a6faf847eb4f" />


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
  <img width="1396" height="439" alt="3" src="https://github.com/user-attachments/assets/36807718-35cd-4ff2-bf75-46b6785217ec" />

- And build it using the command **docker-compose up --build**
  <img width="1403" height="890" alt="3 1" src="https://github.com/user-attachments/assets/f5693fb1-a8c9-4117-87da-be516b35ea1e" />


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
<img width="1405" height="553" alt="4 4" src="https://github.com/user-attachments/assets/52cf7dee-6d2d-4c33-aaca-e50843d9667b" />
<img width="1409" height="689" alt="4 5" src="https://github.com/user-attachments/assets/70a4b7de-91b3-4655-8cf3-115a2b38d8aa" />
  
- Then I tried installing Java version 17 and running but the issue remained.
  <img width="1406" height="768" alt="4 7" src="https://github.com/user-attachments/assets/933e53cb-e241-4063-8176-e026bff0ba0d" />
  <img width="1037" height="532" alt="4 8" src="https://github.com/user-attachments/assets/de63a79b-5b42-4f8c-bf85-18aa4bb66305" />
  <img width="200" height="197" alt="image" src="https://github.com/user-attachments/assets/12249f72-92d0-4338-a6a8-bb2f9c2722ff" />


 
- Then I tried **sudo su - jenkins** I entered the jenkins user account when I tried to exit jenkins started working and it gave password to login to jenkins from **localhost:8080**.
  <img width="1413" height="892" alt="4 9" src="https://github.com/user-attachments/assets/932728c5-c71d-4ab3-9e36-51b40fefa63e" />
  <img width="1408" height="628" alt="4 10" src="https://github.com/user-attachments/assets/cb318756-c885-46e5-b9a6-bfbacdaa830c" />

- Then went to firefox browser and pasted the password and clicked continue.
  <img width="1410" height="913" alt="4 11" src="https://github.com/user-attachments/assets/cbe5da75-935e-4847-b11d-85a23bfde1f1" />

- Then I installed the suggested plugins.
  <img width="1406" height="920" alt="4 12" src="https://github.com/user-attachments/assets/67696d19-8ac2-43a0-9564-7fef11d7dca1" />
  <img width="1408" height="920" alt="4 13" src="https://github.com/user-attachments/assets/a092b7fc-e1e2-4ed1-996a-55c3cb6b2306" />


- Created a First Admin User.
  <img width="1407" height="922" alt="4 14" src="https://github.com/user-attachments/assets/b158d890-36a8-426d-9227-7312ff8db2f4" />

- Landed in the home page of jenkins.
  <img width="1409" height="925" alt="4 15" src="https://github.com/user-attachments/assets/da99091a-1401-4b6f-8132-57de63b9e3e9" />

- Clicked on new items -> Entered the item name **intuji-devops-internship-challenge** -> selected freestyle project from project type.
  <img width="1408" height="924" alt="4 16" src="https://github.com/user-attachments/assets/c373f8bc-5ec1-4654-8a31-b0d52f14eba0" />

- In build steps I chose Execute Shell and typed docker build -t php-hello-world.
  <img width="1401" height="888" alt="4 17" src="https://github.com/user-attachments/assets/d1ac0531-f4e3-4593-a727-5bf6e705e852" />

- In Source Code Management I chose Git and paste the public repo link and clicked Save.
  <img width="1413" height="926" alt="4 18" src="https://github.com/user-attachments/assets/f06192d2-5a80-4747-a518-515f4c31b603" />

- Then I clicked Build Now and it started building and few minutes later the build was complete.
<img width="443" height="662" alt="4 19" src="https://github.com/user-attachments/assets/d1798229-2c2c-4206-b77f-b83bda9cae13" />
<img width="1405" height="921" alt="4 20" src="https://github.com/user-attachments/assets/8d00b0d0-60e0-4e3f-9da0-4196108d5fa6" />
<img width="1408" height="919" alt="4 21" src="https://github.com/user-attachments/assets/05f0fc87-1f8f-4331-9baf-b055dba10e85" />


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


## After the build was success *le me
<img width="229" height="374" alt="image" src="https://github.com/user-attachments/assets/4df4fd82-6d6f-41e7-990c-15efd70cd21a" />

