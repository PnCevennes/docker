
```
  #Supprimer un docker
  docker stop symfonyenv
  docker rm symfonyenv
  
  #Construire le conteneur
  ./build
  #Lancer le conteneur
  ./start
  
  #Passer en mode shell sur l'image docker
  sudo docker exec -it symfonyenv bash

  #Backup
  docker run --rm --volumes-from postgresql_dbdata_1 -v $(pwd):/backup busybox tar cf /backup/uploads.tar /var/lib/postgresql

  
```
