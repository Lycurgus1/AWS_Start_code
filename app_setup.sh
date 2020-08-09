# Transferring the folders to the database server and  then calling a provision file to automatically >

# copy app folder into server, using devsops student file as key
scp -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@18.203.127.67:~/app/

# enter database machine
ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@18.203.127.67

