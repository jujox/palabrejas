#!/bin/bash

script_directory=$(dirname $0)
num_palabrejas=$(wc -l ${script_directory}/palabrejas | cut -d " " -f 1)
random_num=$(( ( RANDOM % $num_palabrejas )  + 1 ))
palabreja=$(sed "${random_num}q;d" ${script_directory}/palabrejas)
echo -ne "\n$palabreja\n"
echo -ne "\nPulsa 'intro' para definición"
read
echo -ne "\n"
cat definiciones/$palabreja.def | cut -d ":" -f 2
echo -ne "\n\n"
curl -L -s https://dle.rae.es/$palabreja | grep 'name="description"'
echo -ne "\n"
