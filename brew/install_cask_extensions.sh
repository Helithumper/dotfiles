#!/bin/bash
while read line; do
    echo " [+] --- Installing $line"
    brew install --cask $line
done <cask_extensions.txt
