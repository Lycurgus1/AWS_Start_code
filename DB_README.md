# Readme for recording information for database server

## Manual steps

Enter machine
```ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@52.16.174.19```

Copy db folder into server, using devsops student file as key
```scp -i ~/.ssh/DevOpsStudents.pem -r db/ ubuntu@52.16.174.19:~/db/```

cd into db folder
# be careful of these keys, they will go out of date
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# update and upgrading sexiterver
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get -clean
sudo apt-get update

# removing files
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get update
sudo rm -rf /var/lib/apt/lists/partial

# updating and upgrading server to implement file changes
sudo apt-get update -o Acquire::CompressionTypes::Order::=gz
sudo apt-get upgrade -y
sudo apt-get update -y

# sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# remove the default .conf and replace with our configuration
sudo rm /etc/mongod.conf
sudo ln -s /home/ubuntu/db/mongod.conf /etc/mongod.conf

# if mongo is is set up correctly these will be successful
sudo systemctl enable mongod
sudo systemctl restart mongod
sudo systemctl status mongod

# export db_host for db connectivity
export DB_HOST="mongodb://localhost:27017/posts"

## Provisioning 2 AMIs (Amazon Machine Instance)
#### The Task: have /posts running successfully from app ami
#### Prerequisites:
- Create a new db ami (from the EC2 dashboard)
- Provision the new db ami
- Add app ami to the security group of db ami's inbound rule - this allows for bi-lateral communication between the two machines
- create environment variable in app AMI that establishes connection to mongodb

### ***for information regarding creating a new AMI [click here](https://github.com/Spartabariallali/Nodejs_Webapp_App/blob/master/README.md)***

---
***the following instructions require a db ami to have already been created***

## Setting up DB ami

### 1. Syncing files to db ami

The following command syncs files from your os to the db ami

```bash
scp -i ~/.ssh/"YourAws_key.pem" -r ~/Your_path_to_files ubuntu@Your_ami_Ip_address.eu-west-1.compute.amazonaws.com:/home/ubuntu/
```

***In my case***

```bash
 scp -i ~/.ssh/DevOpsStudents.pem -r ~/desktop/nginx_sample_code/nodejs-aws-deploy/environment/db ubuntu@ec2-54-76-170-201.eu-west-1.compute.amazonaws.com:/home/ubuntu/
```

- Verify that files have been properly synced by checking your db ami
```bash
ls
```
- run the command:
```bash
./provision.sh
```
- To see if mongodb is successfully installed run the following command:

```bash
sudo systemctl status mongod
```

- If the you can see the following:

![mongod](imagesmd/mongod.jpeg)

- db ami successfully provisioned

---

### 2. Assigning security group privileges  

- Access your EC2 dashboard and locate your AMIs

- select your db AMI and click the security groups

- select edit inbound rules

- update inbound rules so that the app ami is able to access the db AMI's port 27017

- save and exit


---


### 3. Creating environment variable in App AMI

- ssh into your app AMI
```bash
ssh -i ~/.ssh/"YOUR_AWS_KEY" ubuntu@Your_ami_Ip_address.eu-west-1.compute.amazonaws.com
```

- run the following command ensuring you include your db AMI's public ip address
```bash
export DB_HOST=mongodb://your_DB_ami_public_ip:27017/posts
```

- go to your app directory

- run the following command
```bash
npm install
```
 run your web app via the following command
 ```bash
 node app.js
 ```
- access your webapp via your app AMI's public id
```http://your_app_ami_public_ip/posts```

