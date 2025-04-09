#!/bin/bash

## url de base : https://commons.wikimedia.org/wiki/Category:Algeria_in_the_Bulgarian_Archives

# Indiquer l'url de l'index :

read -p "URL de l'index à fouiller : " index_url bin

# Récupérer la liste des fichiers JPG depuis l'index :

wget -q -O - "$index_url" | 	## -O permet de rediriger la sortie vers stdout et pas un fichier
grep -oP '(?<=href="/wiki/File:)[^"]+\.(jpg|jpeg|tif|png)' | sort -u > /home/ajglb/Images/filenames.txt ## (?<= est un positive lookbehind, c'est à dire qu'il va chercher tout ce qui se trouve après la chaîne spécifiée)

> /home/ajglb/Images/links.txt

# Construire les URLs de téléchargement :

while read filename; do

	# Modifier nom et enregistrer valeur :
	mod_name=$(echo $filename | sed 's/,/%2C/g')

   	# Calculer le MD5 du fichier
    	md5=$(echo -n "$filename" | md5sum | awk '{print $1}') ## md5sum retourne la clé et le nom de fichier, d'où awk
    	first_char=${md5:0:1}	## ${variable:position:longeur} // position = caractère de départ ; longeur = longeur à sélectionner, en caractères
    	first_two_chars=${md5:0:2}

	# Construire l'URL finale
    	download_url="https://upload.wikimedia.org/wikipedia/commons/$first_char/$first_two_chars/$mod_name"

	# Créer un fichier des liens
    	echo $download_url >> /home/ajglb/Images/links.txt

    	wget -q --show-progress -nc -P /home/ajglb/Images/ "$download_url" ## nc signifie no clobber, empêche le téléchargement d'un fichier si déjà présent dans le répertoire dest.

done < /home/ajglb/Images/filenames.txt
