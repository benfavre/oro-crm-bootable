#!/bin/sh

export APP_DATABASE_HOST="db"

echo "App booting"

echo "Composer installing ..."
cd /var/www/html/ && \
composer install

echo "Setting up Nginx ..."
rm /etc/nginx/sites-enabled/*
mv /var/www/html/nginx.conf /etc/nginx/sites-available/default.conf
ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

echo "Secure permissions ..."
chown -R www-app:www-data /var/www/html/

echo "Make Upload path writeable ..."
chown 33:33 -R /var/www/html/web/
chown 33:33 -R /var/www/html/app/cache/

echo "Booting ..."
date > /var/www/html/boottime.txt

echo "All startup tasks have been run !"