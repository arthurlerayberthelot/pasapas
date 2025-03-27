## LINUX VIRTUAL NETWORKING

### NAMESPACE

Espace réseau virtuel permettant d'isoler des ressources réseaux sur une même machine. On l'utilisera par exemple avec un conteneur ou pour séparer différents types de services réseaux. On pourra créer un namespace pour un serveur web et un autre pour une base de données par exemple.

1. Créer un namespace :

``ip netns add web_net``

### VETH

Interface locale virtuelle. Crée par paire. On les utilise pour faire communique un namespace avec un autre ou avec un hôte.

1. Créer une paire de veth et les assigner à un namespace chacun :

``ip link add veth1 netns web_net type veth peer name veth2 netns db_net``

### BRIDGE

Agit comme un switch virtuel et sert à transmettre des paquets aux différentes interfaces connectées. On les utilise pour créer des canaux de transmission entre VMs, conteneurs et hôtes.

1. Créer un bridge :

``ip link add br0 type bridge``

2. Lui assigner une interface physique :

``ip link set eth0 master br0``

### BONDED INTERFACE

Permet d'agréger plusieurs interfaces réseau sur une seule interface logique. Sert à améliorer la bande passante et permet d'obtenir une meilleure résilience ou disponibilité.

1. Créer une interface BOND :

``ip link add bond1 type bond miimon 100 mode active-backup``

``miimon`` est un paramètre permettant de surveiller l'interface BOND. L'option '100' signifie que l'intervale d'observation est de 100 millisecondes.

``mode active-backup``spécifie que seule une interface est active. Si elle s'arrête, une autre prend le relais.

2. Lui assigner une interface physique :

``ip link set eth0 master bond1``

### VLAN

Permet de séparer une interface physique en plusieurs interfaces virtuelles. Utile pour les VMs, namespaces et hôtes.

1. Créer deux vlans sur l'interface eth0 :

``ip link add link eth0 name eth0.2 type vlan id 2``
``ip link add link eth0 name eth0.3 type vlan id 3``

Quand on configure un VLAN, on doit s'assurer que le switch connecté à l'hôte les prendra en charge, par exemple en mettant le port du switch concerné en mode trunk.

### VXLAN

Même utilité que les VLANs mais permet d'en créer 4096 fois plus.

### MACVLAN

Permet de se passer de bridge pour connecter des namespaces. Crée des adresses macs différentes à chaque fois.

1. Créer deux macvlans sur l'interface eth0 :

``ip link add macvlan1 link eth0 type macvlan mode bridge``
``ip link add macvlan2 link eth0 type macvlan mode bridge``

### IPVLAN

Même chose que le macvlan mais assigne la même adresse mac aux différents namespaces.
