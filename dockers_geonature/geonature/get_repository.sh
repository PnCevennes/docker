dir_path=GeoNature
url_repository="https://github.com/PnX-SI/GeoNature.git -b master"

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

if [ -f dockerize.patch ] 
then
    echo "apply patch"
    cd $dir_path
    git apply ../dockerize.patch
    cd $current_dir

fi