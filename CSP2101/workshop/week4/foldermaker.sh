#!/bin/bash
read -p "Type the name of the folder you would like to make: " folderName
read -s -p "Secret password: " secretPassword
mkdir $folderName
echo $secretPassword > secret.txt
mv secret.txt $folderName