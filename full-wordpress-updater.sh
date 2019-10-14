#!/usr/bin/env bash
#must install before you use this script: https://wp-cli.org
#script to update wordpress plugins and themes 
# Assumes site directories are under /var/www/html/siteurl
# to run chmod +x script.sh
# ./script.sh
# if not working read https://askubuntu.com/questions/23009/why-crontab-scripts-are-not-working/23438#23438
#Wordpress full updater - Daily at 9am
#00 09 * * * /bin/bash /var/www/backups/script/wordpress/full-wordpress-updater.sh > /var/log/full-wordpress-updater.log


SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

date

WPSITES=(
domain1.com
domain2.net
domain3.com
domain4.org
)

WPPATH=/var/www/html/

echo " "
echo "Starting WordPress Core, Plugin and Theme Updates"
echo " "

for i in "${WPSITES[@]}"
do
  :

cd $WPPATH$i

echo "--------------------------------------------- "
echo " "
echo "Domain: $i" 
echo "Current Folder:" $(pwd)
echo " "
echo "--------------------------------------------- "

echo " "
echo " "

wp core update --allow-root
wp plugin update --all --allow-root
wp theme update --all --allow-root
wp theme update --all --allow-root

echo "Updates for $i Completed!"

echo " "
echo " "

done


echo " "

echo "WordPress Core, Plugin and Theme Update Complete!"
