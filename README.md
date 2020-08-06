# AWS starter code

## Manual run steps
1. Copy app folder into machine
```scp -i ~/.ssh/DevOpsStudents.pem -r app/ ubuntu@3.250.104.226:~/app/```
2. Enter machine
```ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@3.250.104.226```
3. Update and upgrade server software
```
#  update
sudo apt-get update

# upgrade any packages available
sudo apt-get upgrade -y
```
4. 
