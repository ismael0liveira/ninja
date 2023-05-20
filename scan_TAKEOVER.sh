#!/bin/bash

pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/subs.txt" ];then
	test;
else
	zenity --error --text="REALIZE O RECONHECIMENTO PRIMEIRAMENTE!!";
	exit;
fi

if [ -e $pasta"/scanner/"$1"/resultados/scann_takeover.txt" ];then
	zenity --error --text="SCAN [<TAKEOVER>] NESTE DOMÍNIO JÁ REALIZADO!!";
	exit;
else
	test;
fi

python3 $pasta"/tool_TAKEOVER/"takeover.py -l $pasta"/scanner/"$1"/resultados/subs.txt" -v -t 50 -o $pasta"/scanner/"$1"/resultados/scann_takeover.txt";
