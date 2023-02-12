#!/bin/bash
while read line; do
    echo " [+] --- Installing $line"
    code --install-extension $line
done <vscode_extensions.txt
