# Docker

* Copier `url_repositories.ini.sample` dans `url_repositories.ini` et renseigner les dépôts.
  
`cp url_repositories.ini.sample url_repositories.ini`.

* Copier `docker-compose.yml.sample` dans `docker-compose.yml` et renseigner la config de docker compose (port).
  
`cp docker-compose.yml.sample docker-compose.yml`.

Pour chaque docker à installer, suivre les instructions ci dessous et relancer les dockers avec la commande suivante:

`docker-compose up -d`


## UsersHub

* Copier `settings.ini.sample` dans `settings.ini` et renseigner les dépôts.

`cp settings.ini.sample settings.ini`.

* Exécuter la commande pour installer le docker

`./install_docker.sh usershub`

