FROM python:3.7.0-stretch

RUN apt update && apt install -y --no-install-recommends apt-utils

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt install -y nodejs

ADD TaxHub/requirements.txt /etc/TaxHub/requirements.txt
WORKDIR /etc/TaxHub
RUN pip install -r requirements.txt

ADD TaxHub/static/package.json /opt/static/package.json
WORKDIR /opt/static
RUN npm install

ADD TaxHub /opt
ADD settings.ini /opt/settings.ini
WORKDIR /opt
RUN ./install_app.sh

EXPOSE 5000

CMD ["python", "server.py", "runserver"]
