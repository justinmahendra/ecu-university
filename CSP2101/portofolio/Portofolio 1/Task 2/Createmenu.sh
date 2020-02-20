#!/bin/bash
#Declare Colours as Variable
red="\e[31m"
green="\e[32m"
blue="\e[34m"
magenta="\e[35m"
cyan="\e[36m"
lightgrey="\e[37m"
lightcyan="\e[96m"

main() {
    if [[ "$#" -eq 0 ]]; then
        #If no arguments is passed, display menu
        menu
    else
        #Else pass arguments to be sanitize
        sanitize_input "$1"
    fi
}
menu() {
    # Display menu options
    echo -e """
            ${red}1. Register User
            ${green}2. User Details
            ${blue}3. Edit User
            ${magenta}4. Save User
            ${cyan}5. Change Password
            ${lightgrey}6. Print Report
        """
    # get choices program to ask for user input
    choices
}
choices() {
    read -p "Input choice: " user_input #read user input and save it into variable user_input
    sanitize_input $user_input #Passing user_input arguments to case_statements
}
case_statements() {
    user_input="$1" #Getting passed arguments and running it to a case.
    case $user_input in #Match $user_input to the case statements
    1) echo -e "${red}User Registered";;
    2) echo -e "${green}User Details";;
    3) echo -e "${blue}Editing User";;
    4) echo -e "${magenta}Saving User";;
    5) echo -e "${cyan}Change Password";;
    6) echo -e "${lightgrey}Print Report";;
    esac
}
sanitize_input() {
    CLEAN="$1" #Put argument that is passed into CLEAN variable
    if (( $CLEAN >= 1 && $CLEAN <= 6 )); then #Test if
            user_input=$CLEAN
            case_statements $user_input
        else
            echo -e "${red}Please input numbers between 1 - 6"
            exit 1
    fi
}
main "$@"