#!/bin/bash
cd ../;
pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/paramslimpos.txt" ];then
    test;
else
    terminator -e "echo '\033[33;1mREALIZE O RECONHECIMENTO PRIMEIRAMENTE!!\033[m';bash";
    exit;
fi

if [ -e $pasta"/scanner/"$1"/resultados/resultados_OPEN_REDIRECT.txt" ];then
    terminator -e "echo '\033[33;1mSCAN OPEN REDIRECT NESTE DOMÍNIO JÁ REALIZADO!!\033[m';bash";
    exit;
else
    test;
fi

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<SCAN OPEN REDIRECT />>\033[m\n";

scan=$pasta"/scanner/"$1"/resultados/paramslimpos.txt";

cp $scan "tool_ORALYZER/";

cd "tool_ORALYZER/";

python3 oralyzer.py -l paramslimpos.txt >> $pasta"/scanner/"$1"/resultados/resultados_OPEN_REDIRECT.txt";

rm paramslimpos.txt;

cd ../;
