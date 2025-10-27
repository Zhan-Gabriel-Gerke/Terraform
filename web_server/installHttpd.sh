#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<html><h1>Learning from Terraform user_data!</h1></html>" > /var/www/html/index.html