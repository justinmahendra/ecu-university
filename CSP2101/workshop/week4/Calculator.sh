#!/bin/bash
Blue=\\033[34m
Green=\\033[32m
Red=\\033[31m
Purple=\\033[35m

case $2 in
    +) echo -e "${Blue}$(($1+$3))" ;;
    -) echo -e "${Green}$(($1-$3))" ;;
    x) echo -e "${Red}$(($1*$3))" ;;
    /) echo -e "${Purple}$(($1 / $3)), Remainder $(($1%$3))" ;;
esac
