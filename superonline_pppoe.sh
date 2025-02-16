#!/bin/bash

# Renkli çıktılar için tanımlamalar
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Superonline WAN Şifresi Öğrenme Scripti${NC}"
echo -e "${GREEN}Bu script, modeminizin WAN kullanıcı adı ve şifresini otomatik olarak çekecektir.${NC}\n"

# Gerekli paketleri yükleme
echo -e "${YELLOW}Gerekli paketler yükleniyor...${NC}"
sudo apt update -y
sudo apt install -y pppoe

# Kullanıcıdan Ethernet arayüzünü alma
read -p "Modeminizin bağlı olduğu Ethernet arayüzünü girin (örneğin: eth0 veya enp3s0): " eth_interface
read -p "Superonline Kullanıcı Adınızı girin (örn: xxxxx@fiber): " superonline_user

# pppoe-server-options dosyasını oluşturma
echo -e "${YELLOW}pppoe-server-options dosyası oluşturuluyor...${NC}"
sudo bash -c "cat > /etc/ppp/pppoe-server-options <<EOF
require-pap
login
lcp-echo-interval 10
lcp-echo-failure 2
show-password
debug
logfile /var/log/pppoe-server-log
EOF"

# pap-secrets dosyasını düzenleme
echo -e "${YELLOW}Kullanıcı bilgileri kaydediliyor...${NC}"
sudo bash -c "echo '\"$superonline_user\" * \"\"' >> /etc/ppp/pap-secrets"

# Log dosyasını oluşturma ve izinleri ayarlama
echo -e "${YELLOW}Log dosyası oluşturuluyor...${NC}"
sudo touch /var/log/pppoe-server-log
sudo chmod 0774 /var/log/pppoe-server-log

# pppoe-server başlatma
echo -e "${YELLOW}pppoe-server başlatılıyor...${NC}"
sudo pppoe-server -F -I "$eth_interface" -O /etc/ppp/pppoe-server-options &

sleep 3  # Sunucunun başlaması için kısa bir bekleme süresi

# Şifreyi otomatik olarak çekme
echo -e "${YELLOW}Şifre loglardan çekiliyor...${NC}"
sleep 5
sudo grep "Password" /var/log/pppoe-server-log | tail -1 | awk '{print $NF}' > superonline_password.txt
superonline_password=$(cat superonline_password.txt)

if [ -z "$superonline_password" ]; then
    echo -e "${RED}Şifre bulunamadı! Modem bağlantınızı kontrol edin.${NC}"
else
    echo -e "${GREEN}Superonline WAN Şifreniz: ${superonline_password}${NC}"
    echo -e "Şifreniz aynı zamanda 'superonline_password.txt' dosyasına kaydedildi."
fi

# İşlemi tamamla
echo -e "${GREEN}İşlem tamamlandı. Modeminizi eski bağlantılarına geri döndürebilirsiniz.${NC}"
