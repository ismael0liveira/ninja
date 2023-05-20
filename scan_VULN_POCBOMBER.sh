#!/bin/bash

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANNER - POC BOMBER/>\033[00;37m";
pasta=$(pwd);

python3 tool_POC_BOMBER/pocbomber.py --output $pasta"/scanner/"$1"/resultados/resultados_SCAN_VULNERABILITY_POC_BOMBER.txt" -f $pasta"/scanner/"$1"/resultados/subsResolvidos.txt"
