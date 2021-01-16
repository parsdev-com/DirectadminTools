#/bin/bash
echo "######### PARSDEV Named Check Script"
now=$(date +%y-%m-%d-%H-%M)
for a in `grep '^zone' /etc/named.conf | cut -d'"' -f2`; do
    named-checkzone $a /var/named/$a.db >> /root/parsdev-namedresult-$now.txt
     done
     
echo "Named Error Result:"
echo "======================================================================================"
cat /root/parsdev-namedresult-$now.txt | grep error
echo "======================================================================================"
echo "Please go to DNS management in Direct Admin and fix the DNS error of the above domains"
