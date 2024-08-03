#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/retrivp/permission/main/ipmini"
checking_sc() {
    useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        systemctl stop nginx
        echo -e "$COLOR1גגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגג${NC}"
        echo -e "$COLOR1ג${NC}${COLBG1}          ${WH}ג¢ AUTOSCRIPT PREMIUM ג¢                 ${NC}$COLOR1ג $NC"
        echo -e "$COLOR1גגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגג${NC}"
        echo -e "$COLOR1גגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגג${NC}"
        echo -e "$COLOR1ג            ${RED}PERMISSION DENIED !${NC}                  $COLOR1ג"
        echo -e "$COLOR1ג   ${yl}Your VPS${NC} $ipsaya \033[0;36mHas been Banned${NC}      $COLOR1ג"        
        echo -e "$COLOR1ג     ${yl}Buy access permissions for scripts${NC}          $COLOR1ג"
        echo -e "$COLOR1ג             \033[0;32mContact Your Admin ${NC}                 $COLOR1ג"
        echo -e "$COLOR1גגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגגג${NC}"
        exit
    fi
}
checking_sc

clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
#cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /usr/bin/idchat /root/backup/ &> /dev/null
cp -r /usr/bin/token /root/backup/ &> /dev/null
cp -r /etc/per/id /root/backup/ &> /dev/null
cp -r /etc/per/token /root/backup/token2 &> /dev/null
cp -r /etc/perlogin/id /root/backup/loginid &> /dev/null
cp -r /etc/perlogin/token /root/backup/logintoken &> /dev/null
#cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /etc/xray/config.json /root/backup/xray &> /dev/null
cp -r /etc/xray/ssh /root/backup/ssh &> /dev/null
#cp -r /usr/local/etc/xray /root/backup/xray &> /dev/null
#cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/xray/sshx /root/backup/sshx &> /dev/null
#cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
#cp -r /etc/crontab /root/backup/crontab &> /dev/null
cp -r /etc/vmess /root/backup/vmess &> /dev/null
cp -r /etc/vless /root/backup/vless &> /dev/null
cp -r /etc/trojan /root/backup/trojan &> /dev/null
cp -r /etc/issue.net /root/backup/issue &> /dev/null
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "
Detail Backup
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan di save link diatas"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu