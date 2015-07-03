#############################################################################
# Fichier docker debian 8.1 : Apache + php5
#############################################################################
FROM debian:8.1


ENV DEBIAN_FRONTEND noninteractive

# Mise a jour du systeme.
RUN apt-get update && \
    apt-get -y dist-upgrade 

# Installation de Apache2
RUN apt-get -y install apache2

# Installation de curl
RUN apt-get -y install curl

# Installation de git
RUN apt-get -y install git

# Installation de php5
RUN apt-get -y install  php5 php5-cli libapache2-mod-php5 libapache2-mod-wsgi \ 
                        php5-pgsql php5-gd php5-curl

RUN mkdir -p /var/www/web
RUN rm /etc/apache2/sites-available/000-default.conf
ADD conf/apache2.default /etc/apache2/sites-available/000-default.conf

#RUN rm /etc/php5/apache2/php.ini
#ADD ./conf/php.ini /etc/php5/apache2/php.ini

#Activation du mode rewrite de apache2
RUN a2enmod rewrite
RUN apache2ctl restart

#Installation de composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#VOLUME ["/var/www"]

EXPOSE 80 443

ENTRYPOINT service apache2 start && tail -f /var/log/apache2/*.log
