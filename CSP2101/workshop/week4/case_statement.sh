#!/bin/bash

echo "1. Create a folder"
echo "2. List files in a folder"
echo "3. Copy a folder"
echo "4. Save a password"
echo "5. Read a password"
echo "6. Print newest file"
read -p "Type any number to proceed: " choice

case $choice in 
    1) ./foldermaker.sh;;
    2) ls;;
    3) ./foldercopier.sh;;
    4) ./savepassword.sh;;
    5) ./conditional.sh;;
    6) ls -Art | tail -n 1;;
esac