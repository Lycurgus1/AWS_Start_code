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


## Setting up the amazon web server
**Access AWS here**
https://eu-west-1.console.aws.amazon.com/console/home?region=eu-west-1

**Steps to follow**
1. Select EC2
2. Click on Instances
3. Launch instance
4. Select ubuntu server 16.04
	- Version dependent on environment wanted 
5. Deploy to the DevOps student VPC
6. Create a subnet of EU west 1a.
7. Enable Public IP
8. Add storage
	- Select 8GiB
9. Next, add tags
	- Name, Then appropriate name
10. Security groups
	- Create new group
	- Source for all will be My IP
	- Add the below rows:
	- SSH
	- HTTP
	- HTTPS
	- Custom TCP. Port range: 3000
	- Custom TCP. Port range: 8080
	- Custom TCP. Port Range: 1024-65535
	- This last port is the ephermal port, allowing installation of software
11. Review and launch
12. Upon launch it will ask for key pair. 
	- Select DevOps student. 
	- Normally an individual key pair would be created
13. Download the relevant SSH key
	- Place it an easy to reference location
