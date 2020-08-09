# AWS starter code

## Dependencies
- Git Bash
	- This is used to access and manipulate the machines
	- Download it here (alongisde other git softwrare): https://git-scm.com/downloads

- Ruby
	- This is used to interact withe the code of the databases
	- Installed at: https://www.ruby-lang.org/en/downloads/

## Installation instructions
1. Create two AWS instances
	- Instructions to this can be seen below under seetting up an amazon web server
	- Make a note of the servers IPs
2. Fork this repositry and download it in an appropriate location
	- The various IPs will need to be changed based on the IPs assigned to the servers
3. Setup the database server
	- ./db_setup.sh
4. Provision the database server
	- cd db/
	- chmod 777 db_provision.sh
	- ./db_provision.sh
	- Mongod status will be shown upon end of the provision script
	- if no errors are present enter exit
5. Setup the app server
	- ./app_setup.sh
	- cd app/
	- chmod 777 provision.sh
	- ./provision.sh
	- pm2 start app.js -f will run the app
6. Access the app
	- The below links will lead to the app
	- http://app_ip_here/post does not work currently

## Links to access file
**http://app_ip_here/**

**http://app_ip_here/fibonacci/8**

## Files where IP needs updating
	- app_setup.sh
	- db_setup.sh
	- app/provision.sh
	- db/db_provision.sh
	- link urls


## Setting up a amazon web server
**Access AWS here**
https://eu-west-1.console.aws.amazon.com/console/home?region=eu-west-1

**Steps to follow**
1. Select EC2
2. Click on Instances
3. Launch instance
4. Select ubuntu server 16.04
	- Version dependent on environment wanted 
5. Deploy to the vpc DevOps student network
6. Create a subnet of EU west 1a.
7. Enable Public IP
8. Add storage
	- Select 8GiB
9. Next, add tags
	- Name, Then appropriate name
10. Security groups
	- Create new group
		- If already created a group, skip the below instructions previously created group
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

## Adding security permissions
1. Navigate to AWS Instance
2. Select actions with your instance selected
3. Select networking
4. Change security groups
5. Add the relevant group
6. This gives access the to person with that security group

## What is AWS?
**Infastructure as a service**
- AWS provides server space and computing capacity amongst many other services it offers

**What is EC2**
- EC2 is Amazon Elastic Compute Cloud Capacity. It provides computing capacity over the cloud

**What is a security group**
- A type of firewall
- A list of IPs allowed and not allowed

## What are "envionments"
**Definition**
- Environments are where code is run

**Types**
- Production is where the developers test it
- Testing - Where the code is tested vigorously
- Deployment - Where code is deployed to customers from
