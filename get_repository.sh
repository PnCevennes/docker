if ["$repository_dir_path" = ""]
then
    echo La variable $repository_dir_path n\'est pas définie.
fi

if ["$repository_url" = ""]
then
    echo La variable $repository_url n\'est pas définie.
fi

dir_path=repositories/$repository_dir_path

# url_repository="https://github.com/PnX-SI/UsersHub.git -b master"
current_dir=$(pwd)

if ! [ -d $dir_path ] 
then

    git clone $url_repository $dir_path

else

    cd $dir_path
    git checkout .
    git pull
    cd $current_dir

fi

cd $current_dir
