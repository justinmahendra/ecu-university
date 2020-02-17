#!/bin/bash
if [ "$#" -ne 3 ]; then #if arguments not equal to 3, then print Illegal number of parameters. 
    echo "Illegal number of parameters"
    exit 1
fi
cur_file="$1"

for file_name in "$@s";
do
    if [ "$file_name" -nt "$cur_file" ]; then
        cur_file="$file_name"
    fi
done
echo "$cur_file is the newest files"