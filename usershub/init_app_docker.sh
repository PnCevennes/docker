#!/bin/bash
DIR=$(readlink -e "${0%/*}")

. config/settings.ini

# Création des fichiers de configuration
cd config

echo "Création du fichier de configuration ..."
if [ ! -f config.py ]; then
  cp config.py.sample config.py
fi

echo "préparation du fichier config.py..."
sed -i "s/SQLALCHEMY_DATABASE_URI = .*$/SQLALCHEMY_DATABASE_URI = \"postgresql:\/\/$user_pg:$user_pg_pass@$db_host:$pg_port\/$db_name\"/" config.py

url_application="${url_application//\//\\/}"
# on enleve le / final
if [ "${url_application: -1}" = '/' ]
then
url_application="${url_application::-1}"
fi
sed -i "s/URL_APPLICATION =.*$/URL_APPLICATION ='$url_application'/g" config.py

#création d'un fichier rotation des logs une fois qu'ils sont créés
echo "création d'un fichier rotation des logs une fois qu'ils sont créés"

sudo cp $DIR/log_rotate /etc/logrotate.d/uhv2
sudo -s sed -i "s%APP_PATH%${DIR}%" /etc/logrotate.d/uhv2
sudo logrotate -f /etc/logrotate.conf

echo c