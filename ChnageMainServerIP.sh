#!/bin/bash
echo -----------------------------------------------
echo 1 - Directadmin License Key :
read LID
echo 2 - OLD Main IP :
read LIPOLD
getip() {
    local _ip _line
    while IFS=$': \t' read -a _line ;do
        [ -z "${_line%inet}" ] &&
           _ip=${_line[${#_line[1]}>4?1:2]} &&
           [ "${_ip#127.0.0.1}" ] && echo $_ip && return 0
      done< <(LANG=C /sbin/ifconfig)
}
LIP=$(getip)
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
echo update directadmin license....
echo -----------------------------------------------
/usr/local/directadmin/scripts/getLicense.sh $LID
systemctl restart directadmin
echo -----------------------------------------------
