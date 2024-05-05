# NTLMRelay Saldırısı için Otomatik İşlem Scripti

Bu bash scripti, Impacket aracını kullanarak NTLM Relay saldırılarını gerçekleştirmek için tasarlanmıştır. Ayrıca Bu script, Linux işletim sistemi üzerinde çalışır ve Impacket aracının yüklü olması gerekmektedir. Kullanım senaryosu olarak, belirli bir ağdaki Windows makinalarına karşı NTLM Relay saldırılarını gerçekleştirmek için kullanılabilir.

Bu saldırının genel olarak işlevsel olduğu "SMB Signing not required" gibi düşük seviyeli çıkan zaafiyetleri kritik seviyeye taşıyabilecek güçtedir.

### Gereklilikler
Başlamadan önce her zamanki gibi bash script kodunu kullanabilmek için scripte full yetki tanımlamamız gerekiyor:

#### Örnek: chmod +x ntlmrelay.sh

Github üzerinden dosya linuxta başlatıldığında betik hatası belirmekte bunun içinde dosyayı dos2unix ile hızlıca compile edip başlatabilirsiniz.
#### Örnek: dos2unix ntlmrelay.sh

## Kullanım

1. İlk olarak, HTTP ve SMB özellikleri devre dışı bırakılır.
2. Kullanıcıdan bir IP listesi dosyası alınır.
3. Belirtilen IP adreslerindeki SMB servisleri taranır.
4. Bulunan IP adresleri işlenir ve NTLMRelayX & Responder aracı başlatılır.
5. İşlemler tamamlandıktan sonra, HTTP ve SMB özellikleri yeniden etkinleştirilir.


ntlmrelayx terminalinde session yakalanırsa örneğin 192.168.1.1:10001
Netcat ile reverse shell alınır. 
