#!/bin/bash

pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/subsResolvidos.txt" ];then
    test;
else
    zenity --error --text="REALIZE O RECONHECIMENTO PRIMEIRAMENTE!!";
    exit;
fi

if [ -e $pasta"/scanner/"$1"/resultados/resultados_pwn.txt" ];then
    zenity --error --text="SCAN PWNXSS NESTE DOMÍNIO JÁ REALIZADO!!";
    exit;
else
    test;
fi

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<SCAN XSS - PWNXSS/>>\033[m\n";

for site in $(cat $pasta"/scanner/"$1"/resultados/subsResolvidos.txt");do
	echo -e "\n\n\nURL: "$site"\n\n\n" >> $pasta"/scanner/"$1"/resultados/resultados_pwn.txt";
	python3 $pasta"/tool_PWNXSS/"pwnxss.py -u $site --payload="\">-alert(1)-<sCrIpT>alert(23422222222222222)</SCrIpt>" >> $pasta"/scanner/"$1"/resultados/resultados_pwn.txt";
done
