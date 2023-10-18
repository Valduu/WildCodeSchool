!/bin/bash

echo "le script c'est bien lancé"

nom_db=$1
echo "Le parametre est $nom_db"

apt install mariadb-server mariadb-client -y

mdpaleatoire=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16) 

mysql -e "CREATE DATABASE $nom_db ;"
mysql -e "CREATE USER IF NOT EXISTS '$nom_db'@'localhost' IDENTIFIED BY '$mdpaleatoire' ;" 
mysql -e "GRANT ALL PRIVILEGES ON $nom_db.* TO '$nom_db'@'localhost' ;"
mysql -e "FLUSH PRIVILEGES ;"

mysql -e "SHOW DATABASES ;"
echo "votre nouveau mot de passe est $mdpaleatoire fin de phrase"
echo "La base et le compte ont bien été créés."



