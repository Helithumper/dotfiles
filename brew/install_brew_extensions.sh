#!/bin/bash
while read line; do
    echo " [+] --- Installing $line"
    brew install $line
done <brew_list.txt
