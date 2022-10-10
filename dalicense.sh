#/bin/bash
/usr/local/directadmin/directadmin config-set update_channel alpha
curl "https://download.directadmin.com/directadmin_d7c2caef493396249f4ccaa6962ab248b37a58fb_linux_amd64.tar.gz" --output "/root/da.tar.gz"
tar xzf "/root/da.tar.gz" -C /usr/local/directadmin
/usr/local/directadmin/directadmin permissions || true
/usr/local/directadmin/scripts/update.sh
service directadmin restart
