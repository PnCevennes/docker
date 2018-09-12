from python:3.7.0-stretch

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
run apt update && apt install -y nodejs sudo

add UsersHub /opt
add settings.ini /opt/config/settings.ini

workdir /opt

run ./install_app.sh

expose 5001

cmd ["python3", "server.py"]
