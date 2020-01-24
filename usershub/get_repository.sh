dir_path=UsersHub
url_repository="https://github.com/PnX-SI/UsersHub.git -b master"

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
