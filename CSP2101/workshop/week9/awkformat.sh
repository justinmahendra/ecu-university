#!/bin/bash
echo "Your shopping list is as follows:"
awk 'BEGIN {
    FS=","
    }
    {
    print $1
    }' shopping.csv