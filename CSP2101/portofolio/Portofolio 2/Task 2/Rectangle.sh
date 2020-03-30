#!/bin/bash
#Output Student Name and Student ID to Terminal
printf '=%.0s' {1..35}
echo -e '\nPortfolio 2 \t: Stream Editors'
echo -e 'Student Name \t: Justin Mahendra'
echo -e 'Student ID \t: 10526418'
printf '=%.0s' {1..35}
echo ''
#First SED will try to find every whitespace and change it into commas
#Second SED will try to find 'Rec' and replace it with 'Name: Rec'
#Third SED will try to find the first ',' and change it into " Height: "
#Fourth SED will try to find the second ',' and change it into " Width: "
#Fifth SED will try to find a patern which is comma until comma, so the area column will be subsituted with a blank
#Six SED will try to find the fourth ',' and change to " Colour: "
sed -e 's/ /,/g' rectangle.txt | sed -e 's/Rec/Name: Rec/g' | sed -e 's/,/ Height: /' | sed -e 's/,/ Width: /' | sed -e 's/,[^,]*/ /' | sed -e 's/,/Colour: /'