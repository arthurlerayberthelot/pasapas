``categorie="Algeria_in_the_Bulgarian_Archives"``

curl -s "https://commons.wikimedia.org/w/api.php?action=query&list=categorymembers&cmtitle=Category:$categorie&cmlimit=max&cmtype=file&format=json&formatversion=2"|jq -r '.query.categorymembers[].title|@uri' > /tmp/filenames.txt

while read filename; do
getim=$(curl -s https://api.wikimedia.org/core/v1/commons/file/$filename|jq -r '.original.url')
echo $filename
curl -# -O $getim
done < /tmp/filenames.txt
