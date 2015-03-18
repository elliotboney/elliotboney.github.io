#!/bin/bash
now=$(date +"%m_%d_%Y")

gg a
git commit -m "Automatic publish --> ${now}" &>/dev/null && echo -e "${Green}[✔] Committed everything!"
gg p