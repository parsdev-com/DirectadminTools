CHANNEL=stable                                                                                             # can be one of: alpha, beta, current, stable
OS_SLUG=linux_amd64                                                                                         # can be: linux_amd64, rhel8_amd64, rhel7_amd64, debian10_amd64, ...
COMMIT=$(dig +short -t txt "$CHANNEL-version.directadmin.com" | sed 's|.*commit=\([0-9a-f]*\).*|\1|')       # can be commit hash literal value if you want specific build to be installed
FILE="directadmin_${COMMIT}_${OS_SLUG}.tar.gz"                                                              # creates download package name from the variables above

curl --location --progress-bar --connect-timeout 10 "http://download.directadmin.com/${FILE}" --output "/root/${FILE}"   # downloads given directadmin build into /root dir
tar xzf "/root/${FILE}" -C /usr/local/directadmin                                                                         # extracts downloaded package to /usr/local/directadmin
/usr/local/directadmin/directadmin permissions || true                                                                    # runs post-upgrade permission fix step
/usr/local/directadmin/scripts/update.sh                                                                                  # runs other post upgrade fixes
service directadmin restart				
