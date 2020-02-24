#!/bin/bash
for ((i = 1 ; i <= 1000 ; i++)); do
    if (( $i == 1 || $i % 3 == 1 )); then
        echo "$i"
    fi
done