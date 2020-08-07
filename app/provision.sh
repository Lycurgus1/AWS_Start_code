#provision file

#!/bin/bash

# transfer files
# scp -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@52.30.88.196:~/app/

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# unlinking default connection file
sudo unlink /etc/nginx/sites-enabled/default

# moving into relevant folder
cd /etc/nginx/sites-available

# deleting default file
sudo rm -rf default

# creating new file for connection
sudo touch reverse-proxy.conf

# changing permission for file
sudo chmod 666 reverse-proxy.conf

# inserting server information into the connection file
echo "server {
     listen 80;
     server_name _;
     location / {
         proxy_pass http://localhost:3000;
         proxy_http_version 1.1;
         proxy_set_header Upgrade $http_upgrade;
         proxy_set_header Connection 'upgrade';
         proxy_set_header Host $host;
         proxy_cache_bypass $http_upgrade;
     }
 }" >> reverse-proxy.conf
# recreating connection to database with new file(default without explicit statement)
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

# test if nginx file was succesfully edited
sudo nginx -t

# restart nginx
sudo service nginx restart

# check status of nginx
sudo service nginx status

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# install npm
sudo apt-get install npm -y
sudo apt-get update

# install pm2
sudo npm install pm2 -g

# change into app folder
#cd /home/ubuntu/app/

# install npm
#sudo install npm -y

# run app
#node app.js
