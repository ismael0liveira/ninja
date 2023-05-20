#!/bin/bash

#Buscando LOG 4SHELL
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<LOG 4SHELL - /LogMePwn/>\033[00;37m";
pasta=$(pwd);

./tool_LOG_4_SHELL/lmp -email 01ismaeloliveira@gmail.com -file $pasta"/scanner/"$1"/resultados/subs.txt" -threads 100
