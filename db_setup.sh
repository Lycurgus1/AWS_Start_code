# Transferring the folders to the database server and  then calling a provision file to automatically install software

# copy db folder into server, using devsops student file as key
scp -i ~/.ssh/DevOpsStudents.pem -r db/ ubuntu@54.75.18.114:~/db/

# enter database machine
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@54.75.18.114


