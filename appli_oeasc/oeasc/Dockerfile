FROM python:3.7.0-stretch

WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt update

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN apt install -y libgeos-dev nodejs

ADD app_oeasc /opt
ADD settings.ini /opt/config/settings.ini

RUN pip install -r requirements.txt

WORKDIR /opt/static

RUN npm install

WORKDIR /opt

RUN install/init_config.sh config/settings.ini

ENV FLASK_APP server.py
ENV FLASK_ENV development

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
