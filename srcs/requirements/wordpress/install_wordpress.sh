#!/bin/sh
wget http://fr.wordpress.org/latest-fr_FR.tar.gz
tar -xzvf latest-fr_FR.tar.gz
rm -r latest-fr_FR.tar.gz
chown -R www-data:www-data /var/www/wordpress