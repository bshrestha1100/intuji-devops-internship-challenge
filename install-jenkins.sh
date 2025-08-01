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
