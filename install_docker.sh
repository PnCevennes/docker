if [ -z $1 ]
then
    echo get_repository.sh : veuillez renseigner le nom du docker
fi

docker_name=$1

if ! [ -d ${docker_naname} ]
then
    echo le repertoire ${docker_name} n\'est pas présent.
    exit 1  
fi

if ! [ -f ${docker_name}/settings.ini ]
then
    echo le fichier ${dirname}/${docker_name}/settings.ini n\'est pas présent.
    exit 1  
fi

. ${docker_name}/settings.ini

echo "install docker for application ${docker_name}"

./get_repository.sh $docker_name

docker-compose build $docker_name
