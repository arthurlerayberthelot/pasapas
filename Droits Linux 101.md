Voici un bref rappel du fonctionnement des permissions dans un système Linux :

***

<b>Il existe trois autorisations standard</b>  pour les fichiers, les répertoires et autres objets :  

- Read ou <b>R</b>, 

- Write ou <b>W</b>,

- Execute ou <b>X</b>.

***

Tous les objets sont associés à : 

- un compte utilisateur (compte utilisateur ou compte système),

- un groupe de comptes.
  
***

Nous définissons les autorisations des objets pour :

- le propriétaire ou <b>u</b>.

- le groupe propriétaire ou <b>g</b>.

- tous les autres ou <b>o</b>.

***

Par exemple, pour accorder toutes les autorisations (rwx) au propriétaire (u) d'un objet, nous utilisons la commande :

````chmod u=rwx /mon/fichier````

***

Mais il existe une méthode plus simple. Chaque type de permission a son équivalent numérique :

- <b>R est 4.</b>

- <b>W est 2.</b>

- <b>X est 1.</b>

Ainsi, si nous voulons donner l'autorisation de lecture seule, la valeur numérique correspondante sera 4. Si nous voulons également donner l'autorisation d'exécuter, il suffit d'additionner les deux valeurs correspondantes, ce qui donne une valeur numérique finale de 5 (4+1).

***

Supposons que nous voulions faire la même chose que précédemment, mais en plus simple. Nous voulons donner un accès complet au propriétaire (u) et aucune autorisation au groupe (g) et à tous les autres (o) :

````chmod 700 /mon/fichier````

Le « 7 » correspond à (u). Il signifie : 4 + 2 + 1 ou R + W + X. Ici, nous avons accordé toutes les permissions à (u). Les deux 0 correspondent à (g) et (o) : aucune permission ne leur est accordée.

***

Pour modifier le propriétaire et/ou le groupe propriétaire d'un objet, nous utilisons la commande :

````chown "user:group" /mon/fichier````

***

Il est toujours utile de vérifier les permissions appliquées à une ressource à l'aide d'un rapide ````ls -l```` dans le répertoire souhaité.

***

Dans un prochain article, j'aborderai les autorisations spéciales : ````SetUID```` et le tristement célèbre ````Sticky Bit````.
