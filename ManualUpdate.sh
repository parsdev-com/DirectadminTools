#!/bin/bash
echo "-----------------------------------------------"
echo "1 - Directadmin User ID - UID :"
read UID
echo "2 - Directadmin License ID - LID :"
read LID
echo ----------------------------------------------
echo update directadmin core...
echo -----------------------------------------------
cd /usr/local/directadmin
wget --no-check-certificate -O update.tar.gz "https://www.directadmin.com/cgi-bin/daupdate?uid=$UID&lid=$LID"
tar xvzf update.tar.gz
./directadmin p
cd scripts
./update.sh
systemctl restart directadmin
