#!/bin/bash
echo -----------------------------------------------
echo 1 - Directadmin User ID - UID :
read UID
echo 2 - Directadmin License ID - LID :
read LID
echo 3 - OLD Main IP :
read LIPOLD
echo 4 - NEW Main IP :
read LIP
echo -----------------------------------------------
echo update directadmin license....
echo -----------------------------------------------
cd /usr/local/directadmin/scripts
./getLicense.sh $UID $LID
systemctl restart directadmin
echo -----------------------------------------------
echo IP Swapping....
echo -----------------------------------------------
cd /usr/local/directadmin/scripts
./ipswap.sh $LIPOLD $LIP
echo -----------------------------------------------
echo restart services...
echo -----------------------------------------------
systemctl restart httpd
systemctl restart nginx
systemctl restart pure-ftpd
systemctl restart exim
systemctl restart dovecot
echo -----------------------------------------------
echo update directadmin core...
echo -----------------------------------------------
cd /usr/local/directadmin
wget --no-check-certificate -O update.tar.gz "https://www.directadmin.com/cgi-bin/daupdate?uid=$UID&lid=$LID"
tar xvzf update.tar.gz
./directadmin p
cd scripts
./update.sh
systemctl restart directadmin
echo -----------------------------------------------
