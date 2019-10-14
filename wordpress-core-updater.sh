#!/usr/bin/env bash

#script to 
# Assumes site directories are under /var/www/html/siteurl
# to run chmod +x script.sh
# ./script.sh
 
WPSITES=(
domain1.com
domain2.net
domain3.com
domain4.org
)

WPPATH=/var/www/html/

echo " "
echo "Starting WordPress Core Updates"
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

echo "Updates for $i Completed!"

echo " "
echo " "

done


echo " "

echo "WordPress Core  Updates Complete!"
