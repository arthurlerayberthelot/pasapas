Je veux créer une copie régulière de mes notes personnelles - un coffre Obsidian présent sur mon laptop - sur un ordinateur
servant de serveur local, un mini-pc sur lequel j'ai installé Rocky Linux et que j'utilise pour faire des tests et de la virtualisation.

Je m'y connecte régulièrement en ssh pour diverses tâches. Je voudrais donc profiter de ça pour faire une copie automatique de mes notes
sur le disque du serveur des fichiers les plus récents seulement.

Je vais utiliser pour ça la commande `rsync`, qui permet entre autre de copier toutes les informations associées aux fichiers, comme le propriétaire, le groupe, les permissions, les liens, etc.

Cette commande sera exécutée depuis le serveur à chaque connexion en ssh.

1. On crée un script bash et on y ajoute la ligne suivante :

`rsync -av --update —progress client@ipclient:/chemin /chemin/destination/serveur`

`-a` active le mode archive. Il signifie qu'on veut tout copier et de manière récursive (toute l'arborescence du répertoire spécifiée).

`v` signifie verbeux et permet d'afficher des informations sur les fichiers transférés à la fin de l'opération.

`--update` spécifie que nous souhaitons mettre à jour les fichiers. Si le fichier existe déjà dans la destination, il ne sera pas recréé. S'il existe mais a une date antérieure à celle du fichier correspondant de la source,
alors il sera mis à jour. S'il n'existe pas, il sera créé.

`progress` affiche des informations sur le transfert en temps réel.

Dans une commande `rsync`on place toujours la source avant la destination.

2. On rend le script exécutable :

`Chmod +x script`

Ici, `+x`signifie qu'on ajoute le droit d'éxecution (x) à l'utilisateur propriétaire du fichier (son créateur).

3. On copie le script dans le répertoire `usr/local/bin` pour qu’il soit exécutable depuis n’importe où :
`sudo mv ./scripts/rsyncvault.sh /usr/local/bin/sync_vault.sh`

5. On ajoute le chemin à la fin du fichier `./.bashrc` de l'utilisateur de notre serveur.

On pouvait écrire directement la ligne de commande dans `.bashrc` mais je trouve plus agréable de pouvoir lire et modifier mon script indépendamment, éventuellement de le compléxifier sans surcharger le `.bashrc`.

Et voilà ! Chaque fois que je me connecte en ssh à mon serveur, celui-ci exécute directement la commande `rsync` après avoir demandé le mot de passe de l'utilisateur du poste source.
