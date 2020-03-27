#!/bin/bash
#Output Student Name and Student ID to Terminal
printf '=%.0s' {1..35}
echo -e '\nPortfolio 2 \t: Stream Editors'
echo -e 'Student Name \t: Justin Mahendra'
echo -e 'Student ID \t: 10526418'
printf '=%.0s' {1..35}
echo ''
#Cut is used to get the fourth column in the csv file
#CSV File was in this format | Name Height Width Area Colour | by using CUT we chose Area column using f4
#Using --complement we select, all the other columns that is not f4.
#printf is used to create a placeholder for corresponding items
#by using sed we are splitting name,height,width,colour into their own placeholders
cut -d , -f4 --complement rectangle.txt | printf "Name: %s  \tHeight: %s  \tWidth: %s \tColour: %s\n" $(sed -e 's/,/\n/g')