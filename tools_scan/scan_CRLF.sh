#!/bin/bash

cd ../;
pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/paramslimpos.txt" ];then
    test;
else
    zenity --error --text="REALIZE O RECONHECIMENTO PRIMEIRAMENTE!!";
    exit;
fi

if [ -e $pasta"/scanner/"$1"/resultados/resultados_CRLF.txt" ];then
    zenity --error --text="SCAN CRLF INJECTION NESTE DOMÍNIO JÁ REALIZADO!!";
    exit;
else
    test;
fi

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<SCAN CRLF INJECTION />>\033[m\n";

python3 tool_CRLF_SUITE/crlfsuite/__main__.py -iT  $pasta"/scanner/"$1"/resultados/paramslimpos.txt" -oN $pasta"/scanner/"$1"/resultados/resultados_CRLF.txt";

cat $pasta"/scanner/"$1"/resultados/paramslimpos.txt" | crlfuzz >> $pasta"/scanner/"$1"/resultados/resultados_CRLF.txt";


