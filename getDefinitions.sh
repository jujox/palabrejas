#!/bin/bash

for j in $(cat palabrejas)
do
    echo $j
    curl -L -s https://dle.rae.es/$j | grep 'name="description"' | cut -d "\"" -f 4 | tee definiciones/$j.def
done
