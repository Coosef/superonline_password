# Superonline WAN Kullanıcı Adı ve Şifresi Çıkarma Scripti

Bu proje, Turkcell Superonline fiber kullanıcılarının modem WAN bağlantı bilgilerini (kullanıcı adı ve şifre) öğrenmesini sağlayan tam otomatik bir Bash scriptidir.

📌 Özellikler

✅ Gerekli paketleri otomatik yükler✅ Kullanıcıdan ethernet arayüzü ve kullanıcı adı bilgilerini ister✅ WAN şifresini otomatik olarak loglardan çeker✅ Şifreyi ekrana yazdırır ve bir dosyaya kaydeder✅ Ubuntu ve Debian tabanlı sistemlerle uyumludur

🛠️ Gereksinimler

Bu scripti çalıştırmak için aşağıdaki gereksinimlere ihtiyacınız vardır:

Ubuntu / Debian tabanlı bir Linux işletim sistemi

Ethernet bağlantısı (Modemin WAN portuna bağlanmalısınız)

Root yetkileri (sudo erişimi gereklidir)

💻 Kurulum

Öncelikle, terminali açın ve aşağıdaki adımları uygulayın:

Depoyu klonlayın

git clone https://github.com/Coosef/superonline_password.git
cd superonline-wan-password

Scripti çalıştırılabilir hale getirin

chmod +x superonline_pppoe.sh

🚀 Kullanım

Scripti çalıştırmak için aşağıdaki komutu kullanın:

sudo ./superonline_pppoe.sh

📝 Kullanım Adımları:

Script çalıştırıldığında Ethernet arayüzünüzü (örneğin eth0 veya enp3s0) ve Superonline kullanıcı adınızı (örn: xxxxx@fiber) soracaktır.

Gerekli yapılandırma dosyaları oluşturulacak ve WAN şifreniz otomatik olarak loglardan çekilecektir.

Şifreniz ekrana yazdırılacak ve ayrıca superonline_password.txt dosyasına kaydedilecektir.

🔍 Çıktı Örneği

Superonline WAN Şifresi Öğrenme Scripti
Gerekli paketler yükleniyor...
Modeminizin bağlı olduğu Ethernet arayüzünü girin (örneğin: eth0 veya enp3s0): eth0
Superonline Kullanıcı Adınızı girin (örn: xxxxx@fiber): abcd@fiber
pppoe-server başlatılıyor...
Şifre loglardan çekiliyor...
Superonline WAN Şifreniz: 12345678
Şifreniz aynı zamanda 'superonline_password.txt' dosyasına kaydedildi.
İşlem tamamlandı!

⚠️ Yasal Feragatname (Disclaimer)

Bu script yalnızca kişisel kullanım ve eğitim amaçlıdır. Kullanımından doğabilecek herhangi bir yasal sorumluluk tamamen kullanıcının kendisine aittir. Bu işlemler internet servis sağlayıcınızın hizmet sözleşmesine aykırı olabilir ve hizmetinizin askıya alınmasına neden olabilir. Bu scriptin kötüye kullanımından dolayı doğabilecek herhangi bir zarardan sorumlu değiliz. Kullanım öncesinde, yerel yasa ve yönetmelikleri gözden geçirmenizi tavsiye ederiz.

📜 Lisans

Bu proje MIT Lisansı altında sunulmaktadır. Açık kaynak olarak kullanabilir, geliştirebilir veya değiştirebilirsiniz.
