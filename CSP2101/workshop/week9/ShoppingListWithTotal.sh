#!/bin/bash
awk 'BEGIN {
    FS=","; 
    print "Your shopping list is as follows:";
    printf "%-13s|%-10s|%-8s|%-8s\n", "Item"," Quantity"," Price"," Total";
    print "-------------|----------|--------|--------"
    total_quantity = 0;
    total_price = 0;
    grand_total = 0;
    }
    {
        total_quantity += $2
        total_price += $3
        grand_total += (($2*$3))
        printf "%-13s| %-8d | $%-5.2f | $%-5.2f \n", $1,$2,$3,(($2*$3))
    }
    END {
        print "-------------|----------|--------|--------"
        printf "%-13s| %-8d | $%-5.2f | $%-5.2f \n","TOTAL:",total_quantity,total_price,grand_total
    } ' shopping.csv

