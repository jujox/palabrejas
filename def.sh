#!/bin/bash

script_directory=$(dirname $0)
num_palabrejas=$(wc -l ${script_directory}/palabrejas | cut -d " " -f 1)
random_num=$(( ( RANDOM % $num_palabrejas )  + 1 ))
palabreja=$(sed "${random_num}q;d" ${script_directory}/palabrejas)
echo -ne "\n"
echo -e "\033[32m"
grep -q "RAE" definiciones/$palabreja.def
if [ $? -eq 1 ]; then
    cat definiciones/$palabreja.def
else
    cat definiciones/$palabreja.def | cut -d ":" -f 2-
fi
echo -e "\033[0m"
echo -ne "\nPulsa 'intro' para ver la palabreja"
read
echo -ne "\n\033[1m$palabreja\033[0m\n"
echo -ne "\n"
echo -ne "https://dle.rae.es/$palabreja"
echo -ne "Ver en firefox [y | N] "
read launch_firefox
if [ ! -z $launch_firefox ] && [ $launch_firefox == "y" ]; then
    firefox https://dle.rae.es/$palabreja
fi
echo -ne "\n"
