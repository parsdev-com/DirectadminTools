COMMIT=$(dig +short -t txt "current-version.directadmin.com" | sed 's|.*commit=\([0-9a-f]*\).*|\1|')
wget "https://download.directadmin.com/directadmin_${COMMIT}_linux_amd64.tar.gz" -O "/usr/local/directadmin/update.tar.gz"
tar xzf /usr/local/directadmin/update.tar.gz -C /usr/local/directadmin
/usr/local/directadmin/directadmin p
/usr/local/directadmin/scripts/update.sh
systemctl restart directadmin
rm /usr/local/directadmin/update.tar.gz
