current_install_dir=$(pwd)

if ! [ -f ./settings.ini ]
then

    echo le fichier $(pwd)/settings.ini n''estpas présent
    echo vous pouvez le créer à partir de l'' exemple $(pwd)/settings.ini.sample
    exit 1

fi

cp settings.ini ../usershub/.


./get_repository.sh

cd ../usershub
./get_repository.sh

cd $current_install_dir

echo "Construction du container docker"
echo "Allez prendre deux cafés"
docker-compose build

echo "TERMINÉ !"
echo "lancez docker-compose up -d pour démarrer les serveurs"
