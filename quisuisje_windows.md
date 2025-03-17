Il existe plusieurs façons de récupérer le nom de l'utilisateur actuel via PowerShell. J'en présenterai quelques-unes ici :

***

````whoami````

A l'origine, il s'agit d'une commande UNIX (toujours utilisable sur ses différentes versions). Elle affiche le nom de l'utilisateur connecté précédé du domaine de connexion s'il s'agit d'un poste de travail de domaine.

Depuis quelque temps déjà, c'est aussi une commande DOS qui remplit la même fonction. Elle peut être exécutée aussi bien en CMD qu'en PowerShell.

````whoami /all````  affichera le nom de l'utilisateur, les groupes auxquels il appartient et son identifiant unique.

Cette commande étant un exécutable, son utilisation dans un script PowerShell n'est pas recommandée. Il convient plutôt d'utiliser des variables d'environnement Windows ou des commandes PowerShell.

***

````$env:username```` est une variable d'environnement Windows. Elle permet d'afficher uniquement le nom de l'utilisateur. Elle est donc très utile dans un script si vous avez besoin de ce nom. Nous verrons plus en détail les variables d'environnement dans un autre article.

***

````query user```` 

Commande DOS permettant quatre types de requêtes :

1. process (lorsque vous tapez ````query process````, vous pouvez en effet remarquer à la fin de la liste le processus actif "query.exe"),

2. session (affiche vraisemblablement les sessions ouvertes sur la machine cible),

3. termserver (?),

4. user (affiche le nom de l'utilisateur actuel, sa session, son ID et divers compteurs d'activité).
