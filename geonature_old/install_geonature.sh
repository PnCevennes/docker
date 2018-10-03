#install_geonature.sh

if [ -f GeoNature ]
then
    git pull origin master
else
    git clone https://github.com/PnX-SI/GeoNature.git

docker-compose build