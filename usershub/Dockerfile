FROM python:3.7.0-stretch

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt update && apt install -y nodejs sudo logrotate

# ajout des fichiers d'install des modules python
ADD repository/requirements.txt /etc/usershub/requirements.txt
WORKDIR /etc/usershub
RUN pip install -r requirements.txt

# installation des modules npm
ADD repository/app/static/package.json /opt/app/static/package.json
WORKDIR /opt/app/static/
RUN npm install

ADD init_app_docker.sh /opt/init_app_docker.sh

# ajout de l'appli
RUN ls

ADD repository /opt
ADD settings.ini /opt/config/settings.ini

WORKDIR /opt

RUN ./init_app_docker.sh

ENV FLASK_APP server.py
ENV FLASK_ENV development
ENV PYTHON_PATH /usr/bin/python3

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

