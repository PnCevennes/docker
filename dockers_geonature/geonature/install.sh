if ! [ -f ./settings.ini ]
then

    echo le fichier $(pwd)/settings.ini n''estpas présent
    echo vous pouvez le créer à partir de l'' exemple $(pwd)/settings.ini.sample
    exit 1

fi

./get_repository.sh
current_dir=$(pwd)

cd ../usershub
./get_repository
cd $current_dir

cd ../taxhub
./get_repository
cd $current_dir

echo "Construction du container docker"
echo "Allez prendre un café"
docker-compose build

echo "TERMINÉ !"
echo "lancez docker-compose up -d pour démarrer les serveurs"