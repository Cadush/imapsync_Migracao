#!/bin/bash
# Script de instalação do imapsync no Ubuntu
# Adaptado de: https://imapsync.lamiral.info/INSTALL.d/INSTALL.Ubuntu.txt

echo "🔧 Iniciando instalação das dependências do imapsync..."

sudo apt update && sudo apt install -y \
libauthen-ntlm-perl libclass-load-perl libcrypt-openssl-rsa-perl \
libcrypt-ssleay-perl libdata-uniqid-perl libdigest-hmac-perl \
libdist-checkconflicts-perl libencode-imaputf7-perl libfile-copy-recursive-perl \
libfile-tail-perl libio-compress-perl libio-socket-inet6-perl \
libio-socket-ssl-perl libio-tee-perl libjson-webtoken-perl \
libmail-imapclient-perl libmodule-scandeps-perl libnet-dbus-perl \
libnet-dns-perl libnet-ssleay-perl libpar-packer-perl \
libproc-processtable-perl libreadonly-perl libregexp-common-perl \
libsys-meminfo-perl libterm-readkey-perl libtest-fatal-perl \
libtest-mock-guard-perl libtest-mockobject-perl libtest-pod-perl \
libtest-requires-perl libtest-simple-perl libunicode-string-perl \
liburi-perl libtest-nowarnings-perl libtest-deep-perl \
libtest-warn-perl make time cpanminus

echo "📦 Atualizando módulo Mail::IMAPClient (opcional)..."
sudo cpanm Mail::IMAPClient

echo "⬇️ Baixando o script imapsync..."
wget -N https://raw.githubusercontent.com/imapsync/imapsync/master/imapsync

# Alternativa:
# wget -N https://imapsync.lamiral.info/imapsync

echo "✅ Adicionando permissão de execução..."
chmod +x imapsync

echo "🧪 Verificando dependências e uso básico..."
./imapsync

# Para teste real:
# ./imapsync --testslive

echo "🚀 Instalando imapsync no sistema (requer sudo)..."
sudo cp imapsync /usr/bin/

echo "🎉 Instalação concluída com sucesso!"
echo "Bem-vindo ao imapsync 🚀"
echo "Agora você pode rodar o comando: imapsync"
