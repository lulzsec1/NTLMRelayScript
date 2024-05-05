# Impacket ile NTLM Relay Saldırısı Bash Scripti

Bu bash scripti, Impacket aracını kullanarak NTLM Relay saldırılarını gerçekleştirmek için tasarlanmıştır.

## Kullanım

1. İlk olarak, HTTP ve SMB özellikleri devre dışı bırakılır.
2. Kullanıcıdan bir IP listesi dosyası alınır.
3. Belirtilen IP adreslerindeki SMB servisleri taranır.
4. Bulunan IP adresleri işlenir ve NTLMRelayX & Responder aracı başlatılır.
5. İşlemler tamamlandıktan sonra, HTTP ve SMB özellikleri yeniden etkinleştirilir.

