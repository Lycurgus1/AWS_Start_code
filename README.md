# AWS starter code

## Manual run steps
1. Copy app folder into machine
```scp -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@3.250.104.226:~/app/```

2. Enter machine
```ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@3.250.104.226```

3. Update and upgrade server software
```
sudo apt-get update
sudo apt-get upgrade -y
```

4. Install nodejs
```
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
``` 
5. Install pm2
```sudo npm install pm2 -g```

6. Install NGINX
```sudo apt-get install nginx -y```

7. Install npm and node
```
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo apt-get update
```
8. Change into app folder
```cd app/```

9. Install NPM
```sudo npm install -y```

10. Run app
```node app.js```

## Links to check
**http://3.250.104.226:3000/**

**http://3.250.104.226:3000/fibonacci**
