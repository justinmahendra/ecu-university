#!/bin/bash

#Declare Colour Values
cgreen="\e[32m"
cred="\e[31m"
cyellow="\e[33m"

#Declare Global Variables
username=''
DoB=''
address=''
bash_colour=''
fav_colour=''

main(){
    read -p "Input your name: " username #Ask user to input name
    date_of_birth_choice #Run date of birth choice to check if DoB follows a certain format YYYY-MM-DD
    read -p "Input your address: " address #Ask user for address
    favorite_colour_choice #Run Favorite colour choice to determine what the bash output colour would be.
    print_output #Print all the details back to the user
}
date_of_birth_choice(){
    #Loop question until YYYY-MM-DD format is satisfied, then break
    while true;
    do
        read -p "Input your Date of Birth (YYYY-MM-DD): " DoB
        if [[ $DoB =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
            #Break the loop if the format is satisfied
            break
        else
            #Else print invalid input and ask the question again
            echo "Invalid input" 
            continue
        fi
    done
}
favorite_colour_choice(){
    COLOURS="Green Red Yellow" #Table of available colours to choose from
    echo "Input your favorite colour (1-3): "
    select colour in $COLOURS #Select makes COLOURS table into 1..3 depending on how many items are in the list
    do
        case $colour in
        Green) 
            bash_colour=$cgreen #Saves green colour code to bash_colour variable for later use
            fav_colour="Green" #Saves green into fav_colour variable to be output on print_output
            break;; #Break the program
        Red) 
            bash_colour=$cred 
            fav_colour="Red"
            break;;
        Yellow) 
            bash_colour=$cyellow
            fav_colour="Yellow"
            break;;
        *) 
            echo "Invalid Entry" #Any other entry than 1,2 or 3 will be rejected.
        esac
    done
}
print_output() {
    #Prints all the detail out
    echo -e 
    """${bash_colour}
        Name\t\t: $username
        Date of Birth\t: $DoB
        Address\t\t: $address
        Favorite Colour\t: $fav_colour
    """
}
main
