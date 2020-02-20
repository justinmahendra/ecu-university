#!/bin/bash
#Declare Colour Values
green="\e[32m"
red="\e[31m"
yellow="\e[43m"

main(){
    read -p "Enter your name: " username
    read -p "Enter your Date-of-Birth: " DoB
    read -p "Enter your address: " address
    read -p "Enter your favorite colour (green,red or yellow): " fav_colour
    fav_colour=${fav_colour,,} #Convert fav_colour to lowercase
    echo $fav_colour
    print_output
}
print_output() {
    echo -e "${choice_colour}Name: $username"
    echo -e "${choice_colour}Date of Birth: $DoB"
    echo -e "${choice_colour}Address: $address"
    echo -e "${choice_colour}Favorite Colour: $fav_colour"
}
main
