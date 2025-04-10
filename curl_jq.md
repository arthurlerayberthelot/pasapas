## Téléchargement des fichiers images d'une catégorie Wikimedia en utilisant l'API et JQ

```bash
categorie="Algeria_in_the_Bulgarian_Archives"
apiquery="https://commons.wikimedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:$categorie&cmlimit=max&cmtype=file&format=json&formatversion=2"
```

#### Extraction des noms de fichiers de la catégorie :

```bash
curl -s $apiquery|jq -r '.query.categorymembers[].title|@uri' > /tmp/filenames.txt
```

#### Boucle de téléchargement :

```bash
while read filename; do
getim=$(curl -s https://api.wikimedia.org/core/v1/commons/file/$filename|jq -r '.original.url')
curl -# -O $getim
done < /tmp/filenames.txt
```
