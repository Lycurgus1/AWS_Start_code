# Transferring the folders to the database server and  then calling a provision file to automatically >

# copy app folder into server, using devsops student file as key
scp -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@34.245.167.108:~/app/

# enter app machine
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@34.245.167.108

