#!/usr/bin/env bash

# https://www.linuxcapable.com/how-to-install-wordpress-with-lamp-on-debian-linux/

# CUSTOM VARIABLES

DB_NAME=WORDPRESSDB
DB_USER=WPUSER
DB_PASSWORD=PASSWORD
DOMAIN_NAME=wordpress.internal


# CONSTANTS
VER=8.2

TO_INSTALL_1="apache2 mariadb-server mariadb-client"
TO_INSTALL_2="php$VER libapache2-mod-php$VER php$VER-cli php$VER-common"
TO_INSTALL_3="php$VER-zip php$VER-curl php$VER-mysql"
TO_INSTALL="$TO_INSTALL_1 $TO_INSTALL_2 $TO_INSTALL_3"

TO_START="apache2 mariadb"
TO_ENABLE="apache2 mariadb"


install_service () {
  apt-get install -y $1
}

start_service () {
  systemctl is-active --quiet $1
  if [ $? -eq 0 ]; then
    echo "$1 is active!"
  else
	  systemctl start $1
  fi
}

enable_service () {
  systemctl is-enabled --quiet $1
  if [ $? -eq 0 ]; then
    echo "$1 is enabled!"
  else
	  systemctl enable $1
  fi
}


hostnamectl set-hostname $DOMAIN_NAME
sed -i "s/debian12.localdomain/$DOMAIN_NAME/g" /etc/hosts


sudo apt-get update

for SERVICE in $TO_INSTALL; do
	echo "Installing $SERVICE"
	install_service $SERVICE
	echo "Installation completed for $SERVICE"
	echo ""
done

for SERVICE in $TO_START; do
	echo "Starting $SERVICE"
  start_service $SERVICE
	echo "Start complete for $SERVICE"
	echo ""
done

for SERVICE in $TO_ENABLE; do
	echo "Enabling $SERVICE"
  enable_service $SERVICE
	echo "Enabling complete for $SERVICE"
	echo ""
done


# Just in case
a2dissite 000-default.conf
systemctl restart apache2


# Wordpress
wget https://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz -C /var/www/html/

chown -R www-data:www-data /var/www/html/wordpress/
find /var/www/html/wordpress -type d -exec chmod 755 {} \;
find /var/www/html/wordpress -type f -exec chmod 644 {} \;


# Extra Steps:
# - sudo mysql_secure_installation

# https://www.cyberciti.biz/faq/run-sql-query-directly-on-the-command-line/

mariadb -u root -e "CREATE DATABASE $DB_NAME;"
mariadb -u root -e "CREATE USER '$DB_NAME'@localhost IDENTIFIED BY '$DB_PASSWORD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@localhost IDENTIFIED BY '$DB_PASSWORD';"
mariadb -u root -e "FLUSH PRIVILEGES;"

mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wordpress/wp-config.php
sed -i "s/username_here/$DB_USER/g" /var/www/html/wordpress/wp-config.php
sed -i "s/password_here/$DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php

cat >> /etc/apache2/sites-available/$DOMAIN_NAME.conf << 'END'
<VirtualHost *:80>
    ServerName DOMAIN_NAME
    ServerAlias www.DOMAIN_NAME
    DocumentRoot /var/www/html/wordpress
    <Directory "/var/www/html/wordpress">
        AllowOverride All
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/wordpress.error.log
    CustomLog ${APACHE_LOG_DIR}/wordpress.access.log combined
</VirtualHost>
END

sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/apache2/sites-available/$DOMAIN_NAME.conf

a2ensite $DOMAIN_NAME.conf

systemctl restart apache2

echo "Add server domain name to your /etc/hosts file"
echo -e "$(hostname -I | cut -d ' ' -f 2)\twordpress.internal"
