#!/bin/bash

num_palabrejas=$(wc -l palabrejas | cut -d " " -f 1)
random_num=$(( ( RANDOM % $num_palabrejas )  + 1 ))
palabreja=$(sed "${random_num}q;d" palabrejas)
echo $palabreja
echo "http://dle.rae.es/?w=$palabreja"
