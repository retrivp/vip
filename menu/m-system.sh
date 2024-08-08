#!/bin/bash
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
ipsaya=$(wget -qO- ifconfig.me)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/retrivp/permission/main/ipmini"
checking_sc() {
useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •               ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "            ${RED}PERMISSION DENIED !${NC}"
echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
echo -e "             \033[0;33mContact Your Admin ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
exit
fi
}
checking_sc
function add-host(){
fun_bar() {
CMD[0]="$1"
CMD[1]="$2"
(
[[ -e $HOME/fim ]] && rm $HOME/fim
${CMD[0]} -y >/dev/null 2>&1
${CMD[1]} -y >/dev/null 2>&1
touch $HOME/fim
) >/dev/null 2>&1 &
tput civis
echo -ne "  \033[0;33mUodate Domain... \033[1;37m- \033[0;33m["
while true; do
for ((i = 0; i < 18; i++)); do
echo -ne "\033[0;32m#"
sleep 0.1s
done
[[ -e $HOME/fim ]] && rm $HOME/fim && break
echo -e "\033[0;33m]"
sleep 1s
tput cuu1
tput dl1
echo -ne "  \033[0;33mUpdate Domain... \033[1;37m- \033[0;33m["
done
echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
tput cnorm
}
sldns() {
wget --no-check-certificate https://raw.githubusercontent.com/retrivp/vip/main/slowdns/installsl.sh && chmod +x installsl.sh && ./installsl.sh
}
res1() {
wget --no-check-certificate http://rmblvpn.my.id/slowdns/rmbl.sh && chmod +x rmbl.sh && ./rmbl.sh
clear
}
#res2() {
#wget https://raw.githubusercontent.com/VIP-VPN/vip/main/slowdns/rmbl1.sh && chmod +x rmbl1.sh && ./rmbl1.sh
#clear
#}
res2() {
wget --no-check-certificate http://rmblvpn.my.id/slowdns/rmbl2.sh && chmod +x rmbl2.sh && ./rmbl2.sh
clear
}
res3() {
wget --no-check-certificate http://rmblvpn.my.id/slowdns/rmbl3.sh && chmod +x rmbl3.sh && ./rmbl3.sh
clear
}
res5() {
wget --no-check-certificate http://rmblvpn.my.id/slowdns/rmbl4.sh && chmod +x rmbl4.sh && ./rmbl4.sh
clear
}
clear
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ ${WH}Please select a your Choice to Set Domain              ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  [ 1 ]  ${WH}Domain kamu Sendri    ${NC}"
echo -e "$COLOR1│"
echo -e "$COLOR1│  [ 2 ]  ${WH}Domain Yang Punya Script     ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
until [[ $dns =~ ^[0-9]+$ ]]; do
read -p "   Please select numbers 1-2 or Any Button(Random) : " dns
done
if [[ $dns == "1" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│             ${WH}TERIMA KASIH                 $COLOR1│${NC}"
echo -e  "$COLOR1│        ${WH}SUDAH MENGGUNAKAN SCRIPT          $COLOR1│${NC}"
echo -e  "$COLOR1│               ${WH}RETRI PROJECT               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan domain kamu Disini : " -e dnss
done
echo ""
echo "$dnss" > /etc/xray/domain
echo "$dnss" > /etc/v2ray/domain
echo "IP=$dnss" > /var/lib/ipvps.conf
read -n 1 -s -r -p "  Press any key to Back Menu"
menu
clear
elif [[ $dns == "2" ]]; then
clear
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ \033[1;37mPlease select a your Choice to Set Domain$COLOR1│${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│  [ 1 ]  \033[1;37mDomain xxx.xnxxms.cloud       ${NC}"
echo -e "$COLOR1│  "
echo -e "$COLOR1│  [ 2 ]  \033[1;37mDomain xxx.berurat.cloud ${NC}"
echo -e "$COLOR1│  "
echo -e "$COLOR1│  [ 3 ]  \033[1;37mDomain xxx.adijaya.cloud     ${NC}"
echo -e "$COLOR1│  "
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
until [[ $domain2 =~ ^[1-5]+$ ]]; do
read -p "   Please select numbers : " domain2
done
if [[ $domain2 == "1" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.xnxxms.cloud       $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn1
done
echo "$dn1" > /etc/xray/domain
echo "$dn1" > /root/subdomainx
cd
sleep 1
fun_bar 'res1'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "2" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.berurat.cloud      $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn2
done
echo "$dn2" > /etc/xray/domain
echo "$dn2" > /root/subdomainx
cd
sleep 1
fun_bar 'res2'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "3" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.adijaya.cloud  $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn3 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn3
done
echo "$dn3" > /etc/xray/domain
echo "$dn3" > /root/subdomainx
cd
sleep 1
fun_bar 'res5'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "4" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.pirang.cloud       $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn4 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn4
done
echo "$dn4" > /etc/xray/domain
echo "$dn4" > /root/subdomainx
cd
sleep 1
fun_bar 'res4'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "5" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.berurat.cloud      $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn5 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn5
done
echo "$dn5" > /etc/xray/domain
echo "$dn5" > /root/subdomainx
cd
sleep 1
fun_bar 'res3'
clear
rm -rf /root/subdomainx
fi
if [[ $domain2 == "6" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│  \033[1;37mContoh subdomain xxx.slowvip.tech        $COLOR1│${NC}"
echo -e  "$COLOR1│    \033[1;37mxxx jadi subdomain kamu               $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn6 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn6
done
echo "$dn6" > /etc/xray/domain
echo "$dn6" > /root/subdomainx
cd
sleep 1
fun_bar 'res6'
clear
rm -rf /root/subdomainx
fi
read -n 1 -s -r -p "  Press any key to Renew Cert or Ctrl + C to Exit"
certv2ray
clear
elif [[ $dns == "3" ]]; then
clear
cd
sleep 1
fun_bar 'sldns'
read -n 1 -s -r -p "  Press any key to Back Menu"
menu
clear
elif [[ $dns == "4" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│             ${WH}TERIMA KASIH                 $COLOR1│${NC}"
echo -e  "$COLOR1│        ${WH}SUDAH MENGGUNAKAN SCRIPT          $COLOR1│${NC}"
echo -e  "$COLOR1│               ${WH}RETRI PROJECT                  $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dns1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan domain kamu Disini : " -e dns1
done
echo ""
echo "$dns1" > /etc/xray/domain
echo "$dns1" > /etc/v2ray/domain
echo "IP=$dns1" > /var/lib/ipvps.conf
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│             ${WH}TERIMA KASIH                 $COLOR1│${NC}"
echo -e  "$COLOR1│        ${WH}SUDAH MENGGUNAKAN SCRIPT          $COLOR1│${NC}"
echo -e  "$COLOR1│               ${WH}RETRI PROJECT                  $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dns2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan Domain SlowDNS kamu Disini : " -e dns2
done
echo $dns2 >/etc/xray/dns
read -n 1 -s -r -p "  Press any key to Back Menu"
menu
clear
elif [[ $dns == "5" ]]; then
clear
echo -e  "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e  "$COLOR1│             ${WH}TERIMA KASIH                 $COLOR1│${NC}"
echo -e  "$COLOR1│        ${WH}SUDAH MENGGUNAKAN SCRIPT          $COLOR1│${NC}"
echo -e  "$COLOR1│               ${WH}RETRI PROJECT                  $COLOR1│${NC}"
echo -e  "$COLOR1└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dnscl =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan domain kamu Disini : " -e dnscl
done
echo ""
echo "$dnscl" > /etc/cloudfront
fi
echo -e " Back To Menu"
sleep 1
menu
}
function auto-reboot(){
clear
if [ ! -e /etc/cron.d/re_otm ]; then
rm -rf /etc/cron.d/re_otm
fi
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis
echo 'echo "Server successfully rebooted on the date of $tanggal hit $waktu." >> /etc/log-reboot.txt' >> /usr/local/bin/reboot_otomatis
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis
chmod +x /usr/local/bin/reboot_otomatis
fi
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[0;100;33m       • AUTO-REBOOT MENU •        \e[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "[\e[36m•1\e[0m] Set Auto-Reboot Setiap 1 Jam"
echo -e "[\e[36m•2\e[0m] Set Auto-Reboot Setiap 6 Jam"
echo -e "[\e[36m•3\e[0m] Set Auto-Reboot Setiap 12 Jam"
echo -e "[\e[36m•4\e[0m] Set Auto-Reboot Setiap 1 Hari"
echo -e "[\e[36m•5\e[0m] Set Auto-Reboot Setiap 1 Minggu"
echo -e "[\e[36m•6\e[0m] Set Auto-Reboot Setiap 1 Bulan"
echo -e "[\e[36m•7\e[0m] Set Auto-Rebooot CPU 100%"
echo -e "[\e[36m•8\e[0m] Matikan Auto-Reboot & Auto-Reboot CPU 100%"
echo -e "[\e[36m•9\e[0m] View reboot log"
echo -e "[\e[36m•10\e[0m] Remove reboot log"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " x
if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been set every an hour."
sleep 2
menu
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 6 hours."
sleep 2
menu
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 12 hours."
sleep 2
menu
elif test $x -eq 4; then
echo -e " CONTOH FORMAT Tiap jam 5 Subuh Tulis 5 "
read -p " Waktu Restart : " wkt
echo "0 $wkt * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a day."
sleep 2
menu
elif test $x -eq 5; then
echo -e " CONTOH FORMAT Tiap jam 8 Malam Tulis 20 "
read -p " Waktu Restart : " wkt2
echo "10 $wkt2 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a week."
sleep 2
menu
elif test $x -eq 6; then
echo -e " CONTOH FORMAT Tiap jam 10 Malam Tulis 20 "
read -p " Waktu Restart : " wkt3
echo "10 $wkt3 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a month."
sleep 2
menu
elif test $x -eq 7; then
cat> /etc/cron.d/autocpu << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/7 * * * * root /usr/bin/autocpu
END
echo "Auto-Reboot CPU 100% TURN ON."
sleep 2
menu
elif test $x -eq 8; then
rm -f /etc/cron.d/reboot_otomatis
rm -f /etc/cron.d/autocpu
echo "Auto-Reboot successfully TURNED OFF."
sleep 2
menu
elif test $x -eq 9; then
if [ ! -e /etc/log-reboot.txt ]; then
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}       ${WH} • AUTO-REBOOT •        ${NC} $COLOR1 $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo "No reboot activity found"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot
else
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}        ${WH}• AUTO-REBOOT •        ${NC} $COLOR1 $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo 'LOG REBOOT'
cat /etc/log-reboot.txt
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot
fi
elif test $x -eq 10; then
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}        ${WH}• AUTO-REBOOT •        ${NC} $COLOR1 $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo "" > /etc/log-reboot.txt
echo "Auto Reboot Log successfully deleted!"
echo -e ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot
elif test $x -eq 0; then
clear
menu
else
clear
echo ""
echo "Options Not Found In Menu"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
auto-reboot
fi
}
function bw(){
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}      • BANDWITH MONITOR •         ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e " ${WH}[${COLOR1}•1${WH}]${NC} ${COLOR1} Lihat Total Bandwith Tersisa"
echo -e " ${WH}[${COLOR1}•2${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap 5 Menit"
echo -e " ${WH}[${COLOR1}•3${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Jam"
echo -e " ${WH}[${COLOR1}•4${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Hari"
echo -e " ${WH}[${COLOR1}•5${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Bulan"
echo -e " ${WH}[${COLOR1}•6${WH}]${NC} ${COLOR1} Tabel Penggunaan Setiap Tahun"
echo -e " ${WH}[${COLOR1}•7${WH}]${NC} ${COLOR1} Tabel Penggunaan Tertinggi"
echo -e " ${WH}[${COLOR1}•8${WH}]${NC} ${COLOR1} Statistik Penggunaan Setiap Jam"
echo -e " ${WH}[${COLOR1}•9${WH}]${NC} ${COLOR1} Lihat Penggunaan Aktif Saat Ini"
echo -e " ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1} Lihat Trafik Penggunaan Aktif Saat Ini [5s]"
echo -e ""
echo -e " [\e[31m•0${WH}]${NC} ${COLOR1} \e[31mBACK TO MENU${NC}"
echo -e " [\e[31m•x${WH}]${NC} ${COLOR1} Keluar"
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1} • TOTAL BANDWITH SERVER TERSISA • ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
2)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1} • TOTAL BANDWITH SETIAP 5 MENIT • ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -5
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
3)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}   • TOTAL BANDWITH SETIAP JAM •   ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -h
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
4)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}  • TOTAL BANDWITH SETIAP HARI •   ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -d
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
5)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}  • TOTAL BANDWITH SETIAP BULAN •  ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -m
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
6)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}  • TOTAL BANDWITH SETIAP TAHUN •  ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -y
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
7)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}    • TOTAL BANDWITH TERTINGGI •   ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -t
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
8)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1} • STATISTIK TERPAKAI SETIAP JAM • ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -hg
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
9)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}     • LIVE BANDWITH SAAT INI •    ${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e   " Press [ Ctrl+C ] • To-Exit"
echo -e ""
vnstat -l
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
10)
clear
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}• LIVE TRAFIK PENGGUNAAN BANDWITH •${NC} $COLOR1 $NC"
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
vnstat -tr
echo -e ""
echo -e "${COLOR1}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;
0)
sleep 1
menu
;;
x)
exit
;;
*)
echo -e ""
echo -e "Anda salah tekan"
sleep 1
bw
;;
esac
}
function limitspeed(){
clear
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(cat /home/limit)
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
function start () {
echo -e "Limit Speed All Service"
read -p "Set maximum download rate (in Kbps): " down
read -p "Set maximum upload rate (in Kbps): " up
if [[ -z "$down" ]] && [[ -z "$up" ]]; then
echo > /dev/null 2>&1
else
echo "Start Configuration"
sleep 0.5
wondershaper -a $NIC -d $down -u $up > /dev/null 2>&1
systemctl enable --now wondershaper.service
echo "start" > /home/limit
echo "Done"
fi
}
function stop () {
wondershaper -ca $NIC
systemctl stop wondershaper.service
echo "Stop Configuration"
sleep 0.5
echo > /home/limit
echo "Done"
}
if [[ "$cek" = "start" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "=================================="
echo -e "    Limit Bandwidth Speed $sts    "
echo -e "=================================="
echo -e "[1]. Start Limit"
echo -e "[2]. Stop Limit"
echo -e "==============================="
read -rp "Please Enter The Correct Number : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
else
clear
echo " You Entered The Wrong Number"
menu
fi
}
function certv2ray(){
clear
echo start
domain=$(cat /etc/xray/domain)
systemctl stop nginx
systemctl stop haproxy
cd /root/
clear
echo "starting...., Port 80 Akan di Hentikan Saat Proses install Cert"
certbot certonly --standalone --preferred-challenges http --agree-tos --email melon334456@gmail.com -d $domain 
cp /etc/letsencrypt/live/$domain/fullchain.pem /etc/xray/xray.crt
cp /etc/letsencrypt/live/$domain/privkey.pem /etc/xray/xray.key
cd /etc/xray
cat xray.crt xray.key >> /etc/xray/funny.pem
chmod 644 /etc/xray/xray.key
chmod 644 /etc/xray/xray.crt
chmod 644 /etc/xray/funny.pem
systemctl start haproxy
systemctl start nginx
menu
}
function clearcache(){
clear
echo ""
echo ""
echo -e "[ \033[32mInfo\033[0m ] Clear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ \033[32mok\033[0m ] Cache cleared"
echo ""
echo "Back to menu in 2 sec "
sleep 2
menu
}
function m-bot2(){
clear
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1  ${WH}Please select a Bot type below                 ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌──────────────────────────────────────────┐${NC}"
echo -e "$COLOR1  [ 1 ] ${WH}Buat/Edit BOT INFO Multi Login SSH, XRAY & TRANSAKSI   ${NC}"
echo -e ""
echo -e "$COLOR1  [ 2 ] ${WH}Buat/Edit BOT INFO Create User & Lain Lain    ${NC}"
echo -e ""
echo -e "$COLOR1  [ 3 ] ${WH}Buat/Edit BOT INFO Backup Telegram    ${NC}"
echo -e "$COLOR1└──────────────────────────────────────────┘${NC}"
read -p "   Please select numbers 1-3 or Any Button(Random) to exit : " bot
echo ""
if [[ $bot == "1" ]]; then
clear
rm -rf /etc/perlogin
mkdir -p /etc/perlogin
cd /etc/perlogin
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Multi Login"
read -rp "Enter Token (Creat on @BotFather) : " -e token2
echo "$token2" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat
echo "$idat" > id
sleep 1
m-bot2
fi
if [[ $bot == "2" ]]; then
clear
rm -rf /etc/per
mkdir -p /etc/per
cd /etc/per
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Akun Dan Lain Lain"
read -rp "Enter Token (Creat on @BotFather) : " -e token3
echo "$token3" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat2
echo "$idat2" > id
sleep 1
m-bot2
fi
if [[ $bot == "3" ]]; then
clear
rm -rf /usr/bin/token
rm -rf /usr/bin/idchat
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Backup Telegram"
read -rp "Enter Token (Creat on @BotFather) : " -e token23
echo "$token23" > /usr/bin/token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idchat
echo "$idchat" > /usr/bin/idchat
sleep 1
m-bot2
fi
menu
}
function speed2(){
apt install -y neofecth >/dev/null
clear
neofetch
speedtest
}
function nameauthor(){
read -rp "Input Your New Name : " -e name
echo "$name" > /etc/profil
read -n 1 -s -r -p " Succes Change Press Any key to Back Menu"
menu
}
clear
echo -e " $COLOR1╔══════════════════════════════════════════════════════╗${NC}"
echo -e " $COLOR1║                 ${WH}• SYSTEM MENU •                      ${NC}$COLOR1║ $NC"
echo -e " $COLOR1╚══════════════════════════════════════════════════════╝${NC}"
echo -e " $COLOR1╔══════════════════════════════════════════════════════╗${NC}"
echo -e " $COLOR1║ ${WH}[01] • GANTI DOMAIN                ${NC} ${WH}[07] • LIMIT SPEED$NC"
echo -e " $COLOR1║ ${WH}[02] • SPEEDTEST                   ${NC} ${WH}[08] • GANTI BANNER$NC"
echo -e " $COLOR1║ ${WH}[03] • MENU AUTO REBOOT            ${NC} ${WH}[09] • FIX NGINX OFF$NC"
echo -e " $COLOR1║ ${WH}[04] • CEK TRAFIK BANDWIDTH        ${NC} ${WH}[10] • CEK PERFORMA VPS $NC"
echo -e " $COLOR1║ ${WH}[05] • GANTI NAMA CLIENT SCRIPT    ${NC} ${WH}[11] • MENU CHANGE CORE$NC"
echo -e " $COLOR1║ ${WH}[06] • MENU TCP BBR HIGH SPEED     ${NC} ${WH}[12] • MENU BOT NOTIF$NC"
echo -e " $COLOR1║ ${WH}[00] • KEMBALI KE MENU             ${NC} ${WH}[99] • BERSIHKAN CACHE VPS$NC"
echo -e " $COLOR1╚══════════════════════════════════════════════════════╝${NC}"

# Prompt for user input
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"
read opt

# Process user input
case $opt in
    01) clear; add-host; exit ;;
    02) clear; speed2; exit ;;
    03) clear; auto-reboot; exit ;;
    04) clear; bw; exit ;;
    05) clear; nameauthor; exit ;;
    06) clear; m-tcp; exit ;;
    07) clear; limitspeed; exit ;;
    08) clear; nano /etc/issue.net; exit ;;
    09) clear; certv2ray; exit ;;
    10) clear; htop; exit ;;
    11) clear; coremenu; exit ;;
    12) clear; m-bot2; exit ;;
    99) clear; clearcache; exit ;;
    00) clear; menu; exit ;;
    *) echo -e ""; echo "Anda salah tekan"; sleep 1; m-system ;;
esac