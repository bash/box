#!/bin/sh

# Enable EPEl repo
yum install -y epel-release

# Mongodb
rpm --import https://www.mongodb.org/static/pgp/server-3.2.asc

cat <<EOF > /etc/yum.repos.d/mongodb-org-3.2.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
EOF

sudo yum install -y mongodb-org

# Nginx
cat <<EOF > /etc/yum.repos.d/nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/mainline/centos/\$releasever/\$basearch/
gpgcheck=0
enabled=1
EOF

yum install -y nginx

# PHP 7
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7*.rpm

yum clean all
yum install -y php70 php-cli php-dom php-xsl php-mbstring php-mssql php-gd php-pecl-imagick php-tidy php-soap php-mysqlnd php-dom php-pdo php-devel php-pear php-redis php-fpm --enablerepo remi-php70

yum -y install gcc php-pear php-devel openssl-devel
pecl install mongodb
echo "extension=mongodb.so" > /etc/php.d/50-mongo.ini

# Redis
yum -y install redis

# Misc.
yum -y install vim

# Enable Services
systemctl enable nginx.service
systemctl enable php-fpm.service
systemctl enable mongod.service
systemctl enable redis.service
