#!/bin/bash
cd /home/ec2-user
touch teste.txt
echo "hehehehehe" > /home/teste.txt
yum update -y
yum install -y httpd
echo "Helloooooo" > /var/www/html/index.html
service httpd start

sudo yum install -y epel-release
sudo yum install -y stress