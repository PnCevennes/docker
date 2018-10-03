
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

cd usershub/UsersHub
git apply ../dockerize.patch
cd ../..


if ! [ -d geonature/GeoNature ]
then
git clone https://github.com/PnX-SI/GeoNature.git -b master geonature/GeoNature
else
    cd geonature/GeoNature
    git checkout .
    git pull
    cd ../..
fi

if ! [ -d taxhub/TaxHub ]
then
git clone https://github.com/PnX-SI/TaxHub.git -b master taxhub/TaxHub
else
    cd taxhub/TaxHub
    git checkout .
    git pull
    cd ../..
fi

cd taxhub/TaxHub
git apply ../dockerize.patch
cd ../..


cp settings.ini usershub/.
cp settings.ini geonature/.
cp settings.ini taxhub/.

echo "Allez prendre trois café"
docker-compose build

echo "TERMINÉ !"
echo "lancez docker-compose up -d pour démarrer les serveurs"
