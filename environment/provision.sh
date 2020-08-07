#provision file

#!/bin/bash

# transfer files
# scp -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@52.30.88.196:~/app/

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

# install nginx
sudo apt-get install nginx -y

# install npm and node
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo apt-get update

# change into app folder
cd app/

# install npm
sudo install npm -y

# run app
node app.js
