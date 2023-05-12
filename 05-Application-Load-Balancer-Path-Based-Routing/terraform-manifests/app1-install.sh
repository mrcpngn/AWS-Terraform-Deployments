#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start 

# Check EC2 IMDS version
#Check IMDSv1 or IMDSv2 is being used on the instance
status_code=$(curl -s -o /dev/null -w "%{http_code}" http://169.254.169.254/latest/meta-data/)
if [[ "$status_code" -eq 200 ]]
then

    instance_id=$(curl http://169.254.169.254/latest/meta-data/instance-id)
    ami_id=$(curl http://169.254.169.254/latest/meta-data/ami-id)
    private_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

    sudo echo "<h1>Welcome to Mads and Ollie</h1>" | sudo tee -a /var/www/html/index.html
    sudo echo "<p>Instance ID: ${instance_id}</p>" | sudo tee -a /var/www/html/index.html
    sudo echo "<p>AMI ID: ${ami_id}</p>" | sudo tee -a /var/www/html/index.html
    sudo echo "<p>Private IP: ${private_ip}</p>" | sudo tee -a /var/www/html/index.html

    sudo mkdir /var/www/html/app1
    sudo echo "<!DOCTYPE html> <html> <body style=\"background-color:rgb(250, 210, 210);\"> <h1>Welcome to Mads and Ollie - APP-1</h1> <p>Instance ID: ${instance_id}</p> <p>Private IP: ${private_ip}</p> <p>Application Version: V1</p> </body></html>" | sudo tee /var/www/html/app1/index.html
    curl -s http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html

  
else

    instance_id=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)
    ami_id=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/ami-id)
    private_ip=$(TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/local-ipv4)

    sudo echo "<h1>Welcome to Mads and Ollie</h1>" | sudo tee -a /var/www/html/index.html
    sudo echo "<p>Instance ID: ${instance_id}</p>" | sudo tee -a /var/www/html/index.html
    sudo echo "<p>AMI ID: ${ami_id}</p>" | sudo tee -a /var/www/html/index.html
    sudo echo "<p>Private IP: ${private_ip}</p>" | sudo tee -a /var/www/html/index.html

    sudo mkdir /var/www/html/app1
    sudo echo "<!DOCTYPE html> <html> <body style=\"background-color:rgb(250, 210, 210);\"> <h1>Welcome to Mads and Ollie - APP-1</h1> <p>Instance ID: ${instance_id}</p> <p>Private IP: ${private_ip}</p> <p>Application Version: V1</p> </body></html>" | sudo tee /var/www/html/app1/index.html

    TOKEN=`curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document | sudo tee -a /var/www/html/app1/metadata.html
fi