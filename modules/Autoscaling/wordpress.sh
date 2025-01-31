# #!/bin/bash
# sudo mkdir /var/www/
# sudo mount -t efs -o tls,accesspoint=fsap-0628b0df403efa1c8 fs-049e3d5e1f789eee1:/ /var/www/
# sudo yum install -y httpd 
# sudo systemctl start httpd
# sudo systemctl enable httpd
# sudo yum module reset php -y
# sudo yum module enable php:remi-7.4 -y
# sudo yum install -y php php-common php-mbstring php-opcache php-intl php-xml php-gd php-curl php-mysqlnd php-fpm php-json
# sudo systemctl start php-fpm
# sudo systemctl enable php-fpm
# wget http://wordpress.org/latest.tar.gz
# tar xzvf latest.tar.gz
# rm -rf latest.tar.gz
# cp wordpress/wp-config-sample.php wordpress/wp-config.php
# sudo mkdir -p /var/www/html/
# sudo cp -R /wordpress/* /var/www/html/
# cd /var/www/html/
# sudo touch healthstatus
# sed -i "s/localhost/KtrontechDB.c1wcugy04w3l.us-east-2.rds.amazonaws.com/g" wp-config.php 
# sed -i "s/username_here/Ktrontechdb/g" wp-config.php 
# sed -i "s/password_here/Willy211#/g" wp-config.php 
# sed -i "s/database_name_here/wordpressdb/g" wp-config.php 
# chcon -t httpd_sys_rw_content_t /var/www/html/ -R
# sudo systemctl restart httpd
# sudo systemctl status httpd