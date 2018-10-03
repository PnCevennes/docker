
FROM python:3.7.0-stretch

# apt install

RUN apt update && apt install -y --no-install-recommends apt-utils libgeos-dev build-essential sudo python3-pip  supervisor git

#RUN if [ -f Geonature ]; then cd GeoNature; git pull origin master;  else git clone https://github.com/PnX-SI/GeoNature.git; fi

RUN yollo

# install virtualvenv

RUN pip3 install virtualenv


# install node js

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs


# install python requirements

ADD GeoNature/backend/requirements.txt /opt/GeoNature/backend/requirements.txt
ADD GeoNature/backend/requirements-dev.txt /opt/GeoNature/backend/requirements-dev.txt
WORKDIR /opt/GeoNature/backend
RUN virtualenv venv
RUN . venv/bin/activate
RUN . venv/bin/activate && pip install -r requirements.txt
RUN . venv/bin/activate && pip install -r requirements-dev.txt


# install node modules

ADD GeoNature/frontend/package.json /opt/GeoNature/frontend/package.json
WORKDIR /opt/GeoNature/frontend
RUN npm install


# init geonature

ADD GeoNature /opt/GeoNature


# install geonature cmd

WORKDIR /opt/GeoNature/backend
RUN . venv/bin/activate && python /opt/GeoNature/geonature_cmd.py install_command


# setting geonature config

ADD settings.ini /opt/GeoNature/config/settings.ini
ADD init_config.sh /opt/GeoNature/config/init_config.sh
WORKDIR /opt/GeoNature
RUN /bin/bash -c "/opt/GeoNature/config/init_config.sh"


# setting geonature config frontend

WORKDIR /opt/GeoNature/backend
RUN . venv/bin/activate && geonature generate_frontend_config --conf-file /opt/GeoNature/config/geonature_config.toml --build=false


#build frontend

WORKDIR /opt/GeoNature/frontend
RUN mkdir -p src/external_assets

RUN cp src/custom/custom.scss.sample src/custom/custom.scss 2>/dev/null || :
RUN cp src/custom/components/footer/footer.component.ts.sample src/custom/components/footer/footer.component.ts 2>/dev/null || :
RUN cp src/custom/components/footer/footer.component.html.sample src/custom/components/footer/footer.component.html 2>/dev/null || :
RUN cp src/custom/components/introduction/introduction.component.ts.sample src/custom/components/introduction/introduction.component.ts 2>/dev/null || :
RUN cp src/custom/components/introduction/introduction.component.html.sample src/custom/components/introduction/introduction.component.html 2>/dev/null || :

WORKDIR /opt/GeoNature/backend

RUN . venv/bin/activate && geonature generate_frontend_tsconfig
RUN ls /opt/GeoNature/config/
RUN more /opt/GeoNature/config/geonature_config.toml
RUN . venv/bin/activate && geonature generate_frontend_modules_route

# build module occtax

WORKDIR /opt/GeoNature/backend
RUN . venv/bin/activate && geonature install_gn_module /opt/GeoNature/contrib/occtax /occtax --build=false

#build front end

WORKDIR /opt/GeoNature/frontend
RUN rebuild node-sass --force
RUN build


#WORKDIR /opt
#EXPOSE 5000

#CMD ["python", "backend/server.py", "runserver"]