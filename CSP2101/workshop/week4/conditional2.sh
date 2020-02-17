#!/bin/bash
if [ "$#" -ne 3 ]; then #if arguments not equal to 3, then print Illegal number of parameters. 
    echo "Illegal number of parameters"
    exit 1
fi
echo "You have put in 3 arguments"