#!/bin/bash

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANEANDO HTTP SMUGGLING - SMUGGLER/>\033[00;37m";
cd ../;
caminho=$(pwd);
for url in $(cat $caminho"/scanner/"$1"/resultados/subsResolvidos.txt");do python3 tool_SMUGGLER/smuggler.py -u $url -l $caminho"/scanner/"$1"/resultados/resultados_smuggling.txt";done
