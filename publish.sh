#!/bin/bash
now=$(date +"%m_%d_%Y")

gg a
git commit -m "Automatic publish --> ${now}"
gg p