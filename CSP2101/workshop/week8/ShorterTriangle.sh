#!/bin/bash
bash ~/Desktop/ECU\ University/CSP2101/workshop/week6/Triangle.sh | sed -n \
"s/The area for a triangle with base:/Base:/;s/ and height:/ Height/;s/ is: / Area:/p"