# Readme for setting up DB server

## Manual steps

Enter machine
```ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@52.16.174.19```

Copy db folder into server, using devsops student file as key
```scp -i ~/.ssh/DevOpsStudents.pem -r db/ ubuntu@52.16.174.19`3:~/db/```


Update and upgrade server software
```
sudo apt-get update
sudo apt-get upgrade -y
```

export db_host for db connectivity
export DB_HOST="mongodb://localhost:27017/posts"
