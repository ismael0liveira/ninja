#!/bin/bash

pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/resultados_TPLMAP.txt" ];then
    zenity --error --text="SCAN SSTI /> NESTE DOMÍNIO JÁ REALIZADO!!";
    exit;
else
    test;
fi


data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<SCAN SSTI - TPLMAP/>>\033[m\n";

for u in $(cat $pasta"/scanner/"$1"/resultados/paramslimpos.txt");do python3 $pasta"/tool_TPLMAP/"tplmap.py -u $u --level=3 | grep "Injection:" && echo $u" \033[33;1mVULNERÁVEL A SSTI\033[m";done >> $pasta"/scanner/"$1"/resultados/resultados_TPLMAP.txt"

