En lisant à propos des requêtes DNS, j'ai appris qu'elles étaient toutes faites, par défaut, via le protocole UDP et sur le port 53.

UDP ne permettant pas le chiffrement des données transmises, il est très facile d'observer ces requêtes DNS en clair.

***

J'utilise TCPDUMP, un logiciel en ligne de commande permettant d'analyser les paquets réseaux en temps réel transitant depuis et vers mon serveur.

***

Pour l'installer sur mon vps Rocky Linux :

```sudo dnf install tcpdump```

La commande pour observer les requêtes DNS est très simple :

```sudo tcpdump -i eth0 udp port 53```

```-i``` spécifie l'interface réseau à écouter, ici ```eth0```.

Depuis un autre shell, je lance une requête curl vers un site web quelconque :

```curl https://www.pipegazette.com```

En direct depuis TCPDUMP, nous pouvons observer la requête DNS envoyée et les différentes informations reçues : domaine voulu, adresses IPv4 et IPv6, serveur de nom, etc.

Une solution pour chiffrer ces requêtes serait d'utiliser les protocoles DNS Over HTTPS (DoH) ou encore DNS Over TLS (DoT) - noms assez transparent - mais cela demande un client et un serveur configurés pour les utiliser.
