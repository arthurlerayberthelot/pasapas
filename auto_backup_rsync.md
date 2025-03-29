Je veux créer une copie régulière de mes notes personnelles - un coffre Obsidian présent sur mon laptop - sur un serveur local, un mini-pc avec Rocky Linux, utilisé pour des tests et de la virtualisation.

---

Je m'y connecte régulièrement en ssh et je voudrais profiter de cette fenêtre pour copier automatiquement mes notes les plus récentes sur le disque du serveur.

---

J'utiliserai pour ça la commande `rsync`, permettant entre autre de copier toutes les informations associées aux fichiers, comme le propriétaire, le groupe, les permissions, les liens, etc.

Cette commande sera donc exécutée depuis le serveur à chaque connexion en ssh.

---

1. On crée un script bash et on y ajoute la ligne suivante :

`rsync -av --update --progress client@ipclient:/chemin /chemin/destination/serveur`

`-a` active le mode archive. Il signifie qu'on veut tout copier de manière récursive (toute l'arborescence du répertoire spécifiée).

`v` signifie verbeux et permet d'afficher à la fin de l'opération des informations sur les fichiers transférés.

`--update` spécifie que nous souhaitons mettre à jour les fichiers. Si le fichier existe déjà dans la destination, il n'est pas recréé. S'il existe mais a une date antérieure à celle du fichier correspondant de la source,
il est mis à jour. S'il n'existe pas, il est créé.

`progress` affiche des informations en temps réel sur le transfert des fichiers.

Dans une commande `rsync` la source est spécifiée avant la destination.

2. On rend le script exécutable :

`Chmod +x script`

`+x`signifie qu'on ajoute le droit d'éxecution (x) à l'utilisateur propriétaire du fichier (son créateur).

3. On copie le script dans le répertoire `usr/local/bin` pour qu’il soit exécutable partout :
`sudo mv ./scripts/rsyncvault.sh /usr/local/bin/sync_vault.sh`

5. On ajoute le chemin du script à la fin du fichier `./.bashrc` de l'utilisateur de notre serveur.

On peut écrire directement la ligne de commande dans `.bashrc` mais je trouve plus agréable de lire et modifier mon script indépendamment et de pouvoir le complexifier sans surcharger le `.bashrc`.

---

Et voilà ! Chaque fois que je me connecte en ssh à mon serveur, celui-ci exécute directement la commande `rsync` après avoir demandé le mot de passe de l'utilisateur du poste source.
