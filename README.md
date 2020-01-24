# Docker

Ce dépôt contient les procédures pour *Dockeriser* les applications relatives à Géonature

Les fichiers `get_repository.sh` et `install_docker.sh` contiennent des procédures génériques pour toutes les applications

Tous deux prennent en argument le nom du docker `<docker_name>` doit être le même que le nom du dossier associé (par ex. `usershub`)

*  `get_repository.sh` : récupère le code de l'application dans le dépot dont l'adresse est renseignée dans le fichier `url_repositories.ini`.
* `install_docker.sh` : execute le fichier précédent et lance la création du docker `docker-compose build <docker_name>`

Pour chaque docker à installer, suivre les instructions ci dessous et relancer les dockers avec la commande suivante:

`docker-compose up -d`

## Configuration

* Copier `url_repositories.ini.sample` dans `url_repositories.ini` et renseigner les dépôts.
  
`cp url_repositories.ini.sample url_repositories.ini`.


* Copier `docker-compose.yml.sample` dans `docker-compose.yml` et renseigner la config de docker compose (port).
  
`cp docker-compose.yml.sample docker-compose.yml`.

Les diffrents dockers disponibles à ce jours sont :

* usershub
* oeasc

## usershub

* Copier `settings.ini.sample` dans `settings.ini` et renseigner les dépôts.

`cp settings.ini.sample settings.ini`.

* Exécuter la commande pour installer le docker

`./install_docker.sh usershub`


## oeasc

* Copier `settings.ini.sample` dans `settings.ini` et renseigner les dépôts.

`cp settings.ini.sample settings.ini`.

* Exécuter la commande pour installer le docker

`./install_docker.sh oeasc`

