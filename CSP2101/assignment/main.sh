#!/bin/bash
LINK_TO_WEBSITE="https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152"
LINK_TO_GALLERY="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/"
PATH_TO_FOLDER="Downloads"
testLink="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC02042.jpg"
function file_downloader(){
    #This function is only used to download images
    wget -o temp/logfile -P $PATH_TO_FOLDER $1
    outputLogging
}
function indexing_website(){
    echo "Indexing Website into an Array"
    wget -O temp/index.html -q $LINK_TO_WEBSITE
    #Opening .html that was downloaded and processing its output to get the proper file names out of the <img src="...">
    temp=$(cat temp/index.html | grep "<img src=" | sed 's/.*\t//' | sed 's/<.*152\///' | sed 's/.jpg.*>//')
    #Converting spaces inside temp variable into commas, to be processed using IFS=',' and saved into an array
    #Without converting the spaces into commas, a bug was found that 2nd element and so on would not be appended into the array
    temp=$(echo $temp | sed 's/ /,/g')
    IFS=',' read -r -a array <<< "$temp"
    echo "Indexing Completed."
}
function downloadSpecific(){
    read -p "Enter a specific image name: " value
    if [[ " ${array[@]} " =~ " ${value} " ]]; then
        file_downloader $LINK_TO_GALLERY$temp.jpg
    else
        echo "File does not exist"
    fi
    #file_downloader $LINK_TO_GALLERY$temp.jpg
}
function downloadEverything(){
    for filename in "${array[@]}"
    do
        file_downloader $LINK_TO_GALLERY$filename.jpg
    done
}
function outputLogging(){
    image_number=$(cat temp/logfile | grep 'Saving' | sed 's/S.*DSC//' | sed 's/.jpg’//')
    file_name=$(cat temp/logfile | grep 'Saving' | sed "s/S.*$PATH_TO_FOLDER\///" | sed "s/’//")
    filesize=$(cat temp/logfile | grep "Length" | sed 's/Length: //')
    echo "Downloading $image_number, with the file name $file_name, with a file size of $filesize"
}

function main(){
    #file_downloader $LINK_TO_WEBSITE
    indexing_website
    #downloadSpecific
    downloadEverything

}
main



#UNUSED CODE
function output_both(){
    #Displays both index and value
    for index in "${!array[@]}"
    do
        echo "$index ${array[index]}"
    done
}
function output_value(){
    #Displays only values
    for i in "${array[@]}"
    do
        echo $i
    done
}
