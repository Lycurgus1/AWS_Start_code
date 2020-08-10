# Readme for recording information for database server
## Provisioning 2 AMIs (Amazon Machine Instance) 
**The Task**
- Have /posts running successfully from app ami

**Prerequisites**
- Create a new DB AMI (from the EC2 dashboard)
- Provision the new DB AMI
- Add app ami to the security group of DB AMI's inbound rule - this allows for bi-lateral communication between the two machines
- create environment variable in app AMI that establishes connection to mongodb

**For information regarding creating a new AMI [click here](https://github.com/Lycurgus1/AWS_Start_code/blob/master/README.md)**
---

## Setting up DB AMI
**The following instructions require a DB AMI to have already been created**

## 1. Syncing files to DB AMI

The following command syncs files from your OS to the DB AMI

```bash
scp -i ~/.ssh/"YourAws_key.pem" -r ~/Your_path_to_files ubuntu@Your_ami_Ip_address:/home/ubuntu/
```

 - For example

```bash
 scp -i ~/.ssh/DevOpsStudents.pem -r ~/desktop/nginx_sample_code/nodejs-aws-deploy/environment/db ubuntu@ec2-54-76-170-201:/home/ubuntu/
```

A. Verify that files have been properly synced by checking your DB AMI
```bash
ls
```
B. run the command:
```bash
./provision.sh
```
C. To see if mongodb is successfully installed run the following command:

```bash
sudo systemctl status mongod
```
---

## 2. Assigning security group privileges  

A. Access your EC2 dashboard and locate your AMIs

B. select your DB AMI and click the security groups

C. select edit inbound rules

D. Update inbound rules so that the app ami is able to access the db AMI's port 27017

E. save and exit

---

## 3. Creating environment variable in App AMI

A. ssh into your app AMI
```bash
ssh -i ~/.ssh/"YOUR_AWS_KEY" ubuntu@Your_ami_Ip_address.eu-west-1.compute.amazonaws.com
```

B. Run the following command ensuring you include your db AMI's public ip address
```bash
export DB_HOST=mongodb://your_DB_ami_public_ip:27017/posts
```
C. Go to your app directory
```cd app/```
D. Run the following command
```bash
npm install
```
E. Run your web app via the following command
 ```bash
 node app.js
 ```
F. Access your webapp via your app AMI's public id
```http://your_app_ami_public_ip/posts```

## Manual steps

### enter machine
```ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@52.16.174.19```

### copy db folder into server, using devsops student file as key
```scp -i ~/.ssh/DevOpsStudents.pem -r db/ ubuntu@52.16.174.19:~/db/```

### be careful of these keys, they will go out of date
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

### update and upgrading server
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get -clean
sudo apt-get update

### removing files
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get update
sudo rm -rf /var/lib/apt/lists/partial

### updating and upgrading server to implement file changes
sudo apt-get update -o Acquire::CompressionTypes::Order::=gz
sudo apt-get upgrade -y
sudo apt-get update -y

### sudo apt-get install mongodb-org=3.2.20 -y
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

### remove the default .conf and replace with our configuration
sudo rm /etc/mongod.conf
sudo ln -s /home/ubuntu/db/mongod.conf /etc/mongod.conf

### if mongo is is set up correctly these will be successful
sudo systemctl enable mongod
sudo systemctl restart mongod
sudo systemctl status mongod

### export db_host for db connectivity
export DB_HOST="mongodb://localhost:27017/posts"
