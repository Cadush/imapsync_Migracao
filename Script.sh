#!/bin/bash

INPUTFILE="users.txt"
HOST1="mail.seudominio.com.br" #origem
HOST2="mail.zimbra.com.br"     #zimbramail
DOMAIN="example.com"           #dominio_cliente  
LOGFILE="log_sync"

date=$(date "+%Y-%m-%d %H:%M:%S")
echo "IMAPSync começado em $date" > "$LOGFILE"
echo "------------------------------------" >> "$LOGFILE"

# Lê as contas do CSV
while IFS=',' read -r u1 p1 u2 p2; do
    echo "Sincronizando $u1 -> $u2"
    echo "Início da sincronização $u1 -> $u2 em $(date '+%H:%M:%S')" >> "$LOGFILE"

    imapsync --nosyncacls --syncinternaldates \
        --exclude "#KnownSpam" --exclude "#FalsePositives" \
        --exclude "Trash" --exclude "Deleted Items" \
        --exclude "Deleted Messages" --exclude "Deleted" \
        --exclude "Sent" --exclude "Sent Items" \
        --exclude "Sent Messages" \
        --host1 "$HOST1" --port1 993 --user1 "$u1" --password1 "$p1" \
        --host2 "$HOST2" --port2 993 --user2 "$u2" --password2 "$p2" >> "$LOGFILE" 2>&1

    echo "Feito $u1 -> $u2 em $(date '+%H:%M:%S')" >> "$LOGFILE"
    echo "------------------------------------" >> "$LOGFILE"
done < "$INPUTFILE"

echo "IMAPSync finalizei em $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOGFILE"
#Armazenamento de mensagens IMAP de origem e o ZCS estejam em execução. 
#logins e credenciais no csv nessa ordem_sourceusername,sourcepassword,destinationusername,destinationpassword
#habilitar login em texto não criptografado para o serviço imap
#Depebdências - Digest::MD5, IO::Socket::SSL, Term::Readkey, Digest:HMAC, Libmail:imapclient (Mail::Imapclient? versão 2.2.9 no momento da escrita.) Date::Imap
