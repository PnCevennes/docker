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

#Activation du mode rewrite de apache2
RUN a2enmod rewrite
RUN apache2ctl restart

#VOLUME ["/var/www"]

EXPOSE 80 443

ENTRYPOINT service apache2 start && tail -f /var/log/apache2/*.log
