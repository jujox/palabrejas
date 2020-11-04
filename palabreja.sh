#!/bin/bash

script_directory=$(dirname $0)
num_palabrejas=$(wc -l ${script_directory}/palabrejas | cut -d " " -f 1)
random_num=$(( ( RANDOM % $num_palabrejas )  + 1 ))
palabreja=$(sed "${random_num}q;d" ${script_directory}/palabrejas)
echo $palabreja
echo -ne "Pulsa 'intro' para firefox http://dle.rae.es/?w=$palabreja"
read
firefox http://dle.rae.es/?w=$palabreja
