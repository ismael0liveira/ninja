#!/bin/bash

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANEANDO WEB DAV - DAVTEST/>\033[00;37m";

caminho=$(pwd);

for url in $(cat $caminho"/scanner/"$1"/resultados/subsResolvidos.txt");do echo -e "\033[32;1mURL: "$url"\033[m\n"; davtest -url $url 2>&1 ;done >> $caminho"/scanner/"$1"/resultados/resultados_davtest.txt"
