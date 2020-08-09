# Readme for setting up DB server

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
