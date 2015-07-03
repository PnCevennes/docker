
*Supprimer un docker
docker stop symfonyenv
docker rm symfonyenv

*Construire le conteneur
./build
*Lancer le conteneur
./start

*Passer en mode shell sur l'image docker
sudo docker exec -it symfonyenv bash
