## Téléchargement des fichiers images d'une catégorie Wikimedia en utilisant l'API et JQ

```bash
categorie="Algeria_in_the_Bulgarian_Archives"
api_query="https://commons.wikimedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:$categorie&cmlimit=max&cmtype=file&format=json&formatversion=2"
```

#### Extraction des noms de fichiers de la catégorie :

```bash
curl -s $api_query|jq -r '.query.categorymembers[].title|@uri' > /tmp/filenames.txt
```

#### Boucle de téléchargement :

```bash
media_query="https://api.wikimedia.org/core/v1/commons/file/$filename"
getim=$(curl -s $media_query|jq -r '.original.url')

while read filename; do curl -# -O $getim; done < /tmp/filenames.txt
```
