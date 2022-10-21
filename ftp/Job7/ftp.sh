#!/bin/bash
apt-get update
apt-get upgrade
apt-get install proftpd-* -y
apt-get install openssl -y
#créer un user
echo  -ne "azerty\nazerty\n" | adduser user1
#créer un fichier ssl
mkdir /etc/proftpd/ssl

#se rendre dans le ssl + créer la  clé

echo -ne "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem
sudo chmod 0640 proftpd.key.pem
#remplacer les fichier conf
ln -sf /home/debian/ftp_maker/conf/modules_link.conf  /etc/proftpd/modules.conf
ln -sf /home/debian/ftp_maker/conf/tls_link.conf /etc/proftpd/tls.conf
ln -sf /home/debian/ftp_maker/conf/proftpd_link.conf /etc/proftpd/proftpd.conf
#dermarrage auto
systemctl enable proftpd
#redemarrer le ftp"s"
systemctl restart proftpd
