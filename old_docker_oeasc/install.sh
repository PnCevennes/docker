#!/bin/bash

# clone les dépots ou les met à jour
if ! [ -d usershub/UsersHub ]
then
git clone https://github.com/PnEcrins/UsersHub.git -b uhv2 usershub/UsersHub
else
    cd usershub/UsersHub
    git checkout .
    git pull
    cd ../..
fi
if ! [ -d oeasc/app_oeasc ]
then
git clone https://github.com/PnCevennes/app_oeasc.git -b develop oeasc/app_oeasc
else
    cd oeasc/app_oeasc
    git pull
    cd ../..
fi

# copie le fichier settings commun pour les deux applications
cp settings.ini usershub/settings.ini
cp settings.ini oeasc/settings.ini

# applique le patch pour usershub
cd usershub/UsersHub
git apply ../dockerize.patch
cd ../..

echo "Allez prendre un café..."
docker-compose build

echo "TERMINÉ !"
echo "lancez docker-compose up -d pour démarrer les serveurs"
