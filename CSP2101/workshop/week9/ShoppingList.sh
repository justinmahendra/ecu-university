#!/bin/bash
echo "Your shopping list is as follows:"
awk 'BEGIN {FS=","; printf "%-15s|%-11s|%-10s\n", "Name"," Quantity"," Price";printf "%-15s|%-11s|%-10s\n","_______________","___________","__________"}
{printf "%-15s| %-10s| $%-10s \n", $1,$2,$3} ' shopping.csv