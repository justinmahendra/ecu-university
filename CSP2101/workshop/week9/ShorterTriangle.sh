#!/bin/bash
bash ~/Desktop/ECU\ University/CSP2101/workshop/week6/Triangle.sh | awk 'BEGIN{
    print "This is the start"
    total = 0
}
{
    printf "Base : %-2d | Height : %d | Area : %d \n",$8,11,$13
    total += $13
}
END {
    print "Total area : " total
}'