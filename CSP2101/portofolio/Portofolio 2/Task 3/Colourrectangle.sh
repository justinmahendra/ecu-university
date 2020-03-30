#!/bin/bash
#Output Student Name and Student ID to Terminal
printf '=%.0s' {1..35}
echo -e '\nPortfolio 2 \t: Regex'
echo -e 'Student Name \t: Justin Mahendra'
echo -e 'Student ID \t: 10526418'
printf '=%.0s' {1..35}
echo ''
echo "Here are the rectangles that have an Area greater than 100 and have the Colour: Red"
#First grep is used to get this format ',***' where stars is a digit
#Second grep is used to select the ones that has Red colour
#Third grep remove any Red colour that has area of 100
grep -E ",[0-9][0-9][0-9]" rectangle.txt | grep -i "Red" | grep -v "100"