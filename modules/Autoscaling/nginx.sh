#!/bin/bash
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
git clone https://github.com/Maarioon/techeon-project.git
mv /techeon-project/reverse.conf /etc/nginx/
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf-
cd /etc/nginx/
touch nginx.conf
sed -n 'w nginx.conf' reverse.conf
sudo systemctl restart nginx
sudo rm -rf reverse.conf
sudo rm -rf /techeon-project