Appli OEASC
===========

Prérequis
---------

Avoir une base de données fonctionnelle pour les applications (schéma de base de donnée créé et données minimales)

```
# apt install git docker.io docker-compose
```

ajouter l'utilisateur qui manipulera docker au groupe docker

```
# usermod -aG docker $USER
```

Étape 1
-------

Copier le fichier settings.ini.sample vers settings.ini et corriger les parametres de connexion à la base de données.


Étape 2
-------

lancer l'installation

```
$ ./install.sh
```

et aller prendre un café


Étape 3
-------

démarrer les applications

```
$ docker-compose up -d
```


Gestion des applis
==================


Voir les applis en cours de fonctionnement
------------------------------------------

```
$ docker ps -a
```


Voir les logs de l'appli
------------------------

```
$ docker logs nom_de_l_appli
```


Arrêter les applis
------------------

```
$ docker-compose stop
```
