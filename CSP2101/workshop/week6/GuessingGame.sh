#!/bin/bash
printError(){
    echo -e "\033[31mERROR:\033[0m $1"
}
getNumber(){
    read -p "$1: "
    while (( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"
        read -p "$1: "
    done
    while true; do
        if (( $REPLY == 42 )); then
            echo "Correct"
            exit
        elif (( $REPLY > 42 )); then
            echo "Too High"
            read -p "$1: "
        elif (( $REPLY < 42 )); then
            echo "Too Low"
            read -p "$1: "
        fi
    done
}
main() {
    getNumber "Please type a number between 1 and 100" 1 100
}
main