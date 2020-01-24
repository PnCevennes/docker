docker_name=$1

if ! [ -d ${dirname} ]
then
    echo le repertoire ${docker_name} n\'est pas présent.
    exit 1  
fi

if ! [ -f ${dirname}/${docker_name}/settings.ini ]
then
    echo le fichier ${dirname}/${docker_name}/settings.ini n\'est pas présent.
    exit 1  
fi

. ${docker_name}/settings.ini

echo "install docker for application ${docker_name}"

./get_repository.sh

cd ${docker_name}
docker_compose build



