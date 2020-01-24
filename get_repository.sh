if [ -z $1 ]
then
    echo get_repository.sh : veuillez renseigner le nom du docker
fi

docker_name=$1

# recuperation des adresse des depots
. url_repositories.ini
url_repository_var_name=url_repository_${docker_name}
url_repository=${!url_repository_var_name}

repository_dir_path=repositories/${docker_name}

current_dir=$(pwd)

if ! [ -d $repository_dir_path ] 
then
    # recupération du dépôt
    git clone $url_repository $repository_dir_path

else
    # mise a jour du depot
    cd $repository_dir_path
    git pull
    cd $current_dir

fi

cd $current_dir
