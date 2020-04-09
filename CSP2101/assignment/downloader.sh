#!/bin/bash
main() {
#wget -O index.html https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152
cat index.html | grep "<img src=" | sed 's/.*\t//' | sed 's/<img src="//' | sed -E 's/" .*>//' > images.txt
while read line; do
wget -P Downloads $line
done < images.txt
}
main