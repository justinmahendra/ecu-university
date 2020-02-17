#!/bin/bash
read -s -p "Secret password: " secretPassword
echo $secretPassword > Test/secret.txt