#!/bin/bash
now=$(date +"%m_%d_%Y")

gg a
git commit -m "Automatic publish --> ${now}" &>/dev/null
gg p