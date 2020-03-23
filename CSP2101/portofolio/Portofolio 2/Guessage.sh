#!/bin/bash
min=20
max=70
function randomGenerator() {
    ((diff=max-min+1))
    local generatedNumber="$((min + $RANDOM%diff))"
    echo "$generatedNumber"
}
regex='^[0-9]+$'
generatedNumber="$(randomGenerator)"
echo $generatedNumber
while true
    do
    read -p "Enter a value between $min - $max: " user_input
    if ! [[ $user_input =~ $regex ]] ; then
    echo "Error: Not a number" >&2;
    else
        if [ $user_input -lt $min ]; then
            echo "Your input is lower than $min"
        elif [ $user_input -gt $max ]; then
            echo "Your input is higher than $max"
        else
            if [ $user_input -gt $generatedNumber ]; then
                echo "Too high"
            elif [ $user_input -lt $generatedNumber ]; then
                echo "Too low"
            elif [ $user_input -eq $generatedNumber ]; then
                echo "Congratulations! You got the number!"
                exit 0
            fi
        fi
    fi
    done




