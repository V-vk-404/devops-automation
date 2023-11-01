#!/bin/bash

# Update the package lists
sudo apt update

# Install Java (Jenkins requires Java)
sudo apt install -y openjdk-11-jre

# Download and install Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

#Install Docker Server
sudo apt-get install docker.io -y

# Start Jenkins service
sudo systemctl start docker
sudo systemctl enable docker

#Add the jenkins to the docker group 
sudo usermod -aG  docker jenkins 

# Get the Jenkins initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
