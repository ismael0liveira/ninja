#!/bin/bash

cd ../;
pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/subsResolvidos.txt" ];then
    test;
else
    terminator -e "echo '\033[33;1mREALIZE O RECONHECIMENTO PRIMEIRAMENTE!!\033['";
    exit;
fi

if [ -e $pasta"/scanner/"$1"/resultados/resultados_CORS.txt" ];then
    terminator -e "echo '\033[33;1mSCAN CORS MISCONFIGURATION NESTE DOMÍNIO JÁ REALIZADO!!\033[m';bash";
    exit;
else
    test;
fi

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<SCAN CORS - MISCONFIGURATION />>\033[m\n";


cat $pasta"/scanner/"$1"/resultados/subsResolvidos.txt" | python3 tool_CORSY/corsy.py > $pasta"/scanner/"$1"/resultados/resultados_CORS.txt";


cat $pasta"/scanner/"$1"/resultados/subsResolvidos.txt" | CorsMe -t 70 >> $pasta"/scanner/"$1"/resultados/resultados_CORS.txt";










