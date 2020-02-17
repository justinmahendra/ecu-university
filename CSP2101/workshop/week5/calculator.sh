##############################
# Author: Justin Mahendra
##############################
#!/bin/bash
main() {
blue="\033[34m"
green="\033[32m"
red="\033[31m"
purple="\033[35m"

case $2 in
    +) echo -e $blue$(($1 + $3));;
    -) echo -e $green$(($1 - $3));;
    /) echo -e $purple$(($1 / $3)) ",remainder" $(($1 % $3));;
    *) echo -e $red$(($1 * $3));;
esac
}
main "$@"