#!/bin/bash
find_linux(){
echo "File name: " $1
sed "/Linux/ i\ --> Next line contains linux!" $1
}
main(){
    if [ "$#" -eq 1 ] && [ -f $1 ];
    then
        find_linux $1
    else
        echo "non-existent file"
        exit 1
    fi
    exit 0
}
main "$@"