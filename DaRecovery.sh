#!/bin/bash
echo Directadmin Server Data Recovery :
echo boot orphaned Directadmin Server with SystemRescueCD and mount old server to /mnt/rescue
echo ----------------------------------
echo Enter New Server IP Address :
read NEWIP
echo Enter New Server SSH Port :
read SSHPort
echo ----------------------------------
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/passwd  root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/group root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/shadow root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/gshadow root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/my.cnf root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/exim*  root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/hosts  root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/httpd/conf/* root@$NEWIP:/etc/httpd/conf/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/named.conf root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/proftpd.conf root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/proftpd.passwd root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/proftpd.vhosts.conf root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/resolv.conf root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/system_filter.exim  root@$NEWIP:/etc/

rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/usr/local/directadmin/conf  root@$NEWIP:/usr/local/directadmin/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/usr/local/directadmin/plugins root@$NEWIP:/usr/local/directadmin/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/mail  root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/etc/virtual root@$NEWIP:/etc/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/var/named root@$NEWIP:/var/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/var/spool/cron root@$NEWIP:/var/spool/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/var/spool/virtual root@$NEWIP:/var/spool/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/var/www root@$NEWIP:/var/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/usr/local/directadmin/data root@$NEWIP:/usr/local/directadmin/

rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/var/lib/mysql  root@$NEWIP:/var/lib/
rsync -avz -e "ssh -p $SSHPort" /mnt/rescue/home/*  root@$NEWIP:/home/
