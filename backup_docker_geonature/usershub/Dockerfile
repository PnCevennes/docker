from python:3.7.0-stretch

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
run apt update && apt install -y nodejs sudo

# ajout des fichiers d'install des modules python
add UsersHub/requirements.txt /etc/usershub/requirements.txt
workdir /etc/usershub
run pip install -r requirements.txt

# installation des modules npm
add UsersHub/app/static/package.json /opt/app/static/package.json
workdir /opt/app/static/
run npm install

# ajout de l'appli
add UsersHub /opt
add settings.ini /opt/config/settings.ini

workdir /opt

run ./install_app.sh

expose 5001

cmd ["python3", "server.py"]
