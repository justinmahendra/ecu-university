#!/bin/bash
#Output Student Name and Student ID to Terminal
printf '=%.0s' {1..35}
echo -e '\nPortfolio 2 \t: Regex'
echo -e 'Student Name \t: Justin Mahendra'
echo -e 'Student ID \t: 10526418'
printf '=%.0s' {1..35}
echo ''
# -w is used to get specific "Red", -i is used for insensitive case
echo "Here are the rectangles that have an Area greater than 100 and have the Colour: Red"
#Cat is used to read the file
#Grep is then used to match rectangle that has Colour Red
#Sed is used to substitude , with an empty space
#Awk is used to print out in a nice format
cat rectangle.txt | grep -w -i "Red" | sed -e 's/,/ /g' | awk '{ if ( $4 > 100 ) 
printf "Name: %s\tHeight: %s\tWidth: %s\tArea: %s\tColour: %s\n" , $1 , $2 ,$3 , $4 ,$5 }' 