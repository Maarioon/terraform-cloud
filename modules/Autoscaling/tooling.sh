# #!/bin/bash
# sudo mkdir -p /var/www/
# sudo mount -t efs -o tls,accesspoint=fsap-044779d064f7280b1 fs-049e3d5e1f789eee1:/ /var/www/
# sudo yum install -y httpd 
# sudo systemctl start httpd
# sudo systemctl enable httpd
# sudo yum module reset php -y
# sudo yum module enable php:remi-7.4 -y
# sudo yum install -y php php-common php-mbstring php-opcache php-intl php-xml php-gd php-curl php-mysqlnd php-fpm php-json
# sudo systemctl start php-fpm
# sudo systemctl enable php-fpm
# git clone https://github.com/citadelict/tooling2.git
# sudo mkdir -p /var/www/html
# sudo cp -rf tooling2/html/*  /var/www/html/
# cd tooling2
# mysql -h KtrontechDB.c1wcugy04w3l.us-east-1.rds.amazonaws.com -u Ktrontechdb -p Willy211# toolingdb < tooling-db.sql
# cd /home/ec2-user
# sudo touch healthstatus
# cd /var/www/html
# sudo sed -i "s/$db = mysqli_connect('mysql.tooling.svc.cluster.local', 'Ktrontechdb', 'Willy211#', 'tooling');/$db = mysqli_connect('citatech-db.c1wcugy04w3l.us-east-2.rds.amazonaws.com', 'admin', 'guessWhat232', 'toolingdb');/g" functions.php
# chcon -t httpd_sys_rw_content_t /var/www/html/ -R
# sudo systemctl restart httpd
# sudo systemctl status httpd