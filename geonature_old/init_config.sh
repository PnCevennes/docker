. config/settings.ini
#if [ ! -f config/geonature_config.toml ]; then
  echo "Création du fichier de configuration ..."
  cp config/geonature_config.toml.sample config/geonature_config.toml
  echo "Préparation du fichie r de configuration..."
  my_url="${my_url//\//\\/}"
  sed -i "s/SQLALCHEMY_DATABASE_URI = .*$/SQLALCHEMY_DATABASE_URI = \"postgresql:\/\/$user_pg:$user_pg_pass@$db_host:$db_port\/$db_name\"/" config/geonature_config.toml
  sed -i "s/URL_APPLICATION = .*$/URL_APPLICATION = '${my_url}geonature' /g" config/geonature_config.toml
  sed -i "s/API_ENDPOINT = .*$/API_ENDPOINT = '${my_url}geonature\/api'/g" config/geonature_config.toml
  sed -i "s/API_TAXHUB = .*$/API_TAXHUB = '${my_url}taxhub\/api'/g" config/geonature_config.toml
  sed -i "s/DEFAULT_LANGUAGE = .*$/DEFAULT_LANGUAGE = '${default_language}'/g" config/geonature_config.toml
  sed -i "s/LOCAL_SRID = .*$/LOCAL_SRID = '${srid_local}'/g" config/geonature_config.toml
#else
#  echo "Le fichier de configuration existe déjà"
#fi