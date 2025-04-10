La commande GNU ``wget`` permet de récupérer des données présentes sur un serveur web. Elle supporte les protocoles HTTP, HTTPS et FTP.

***

On peut, par exemple, télécharger un site entier pour le consulter hors ligne :

````wget -rkpN -e robots=off https://www.example.com/````

``r`` permet d'activer le téléchargement récursif (de toute l'arborescence concernée)

``k`` permet de convertir les liens du document en chemins locaux pour qu'il soit consultable en local.

``p`` force le téléchargement de tous les fichiers nécessaires à l'affichage normal des pages (css, images, scripts, etc)

``N`` spécifie qu'on ne veut télécharger que si les fichiers sont les plus récents. Si ces fichiers sont déjà présents sur le disque, alors le téléchargement est inutile.

``e robots =off`` permet d'ignorer les directives du fichier robots.txt utilisé par le site web pour bloquer certaines pages à l'accès.
