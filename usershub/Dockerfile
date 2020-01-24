FROM python:3.7.0-stretch

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt update && apt install -y nodejs sudo logrotate

# ajout des fichiers d'install des modules python
ADD UsersHub/requirements.txt /etc/usershub/requirements.txt
WORKDIR /etc/usershub
RUN pip install -r requirements.txt

# installation des modules npm
ADD UsersHub/app/static/package.json /opt/app/static/package.json
WORKDIR /opt/app/static/
RUN npm install

ADD init_app_docker.sh /opt/init_app_docker.sh

# ajout de l'appli
ADD UsersHub /opt
ADD settings.ini /opt/config/settings.ini

WORKDIR /opt

RUN ./init_app_docker.sh
#RUN . config/settings.ini


EXPOSE 5001

CMD ["python3", "server.py"]
