#!/bin/bash
for i in {1..10}
    do
        for j in {1..10}
        do
            echo "The area for a triangle with base: $i and height: $j is: " $(($i*$j/2))
        done
    done
