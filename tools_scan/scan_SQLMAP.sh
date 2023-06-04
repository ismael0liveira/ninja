#!/bin/bash

cd ../;
pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/paramslimpos.txt" ];then
    test;
else
    zenity --error --text="REALIZE O RECONHECIMENTO PRIMEIRAMENTE!!";
    exit;
fi

if [ -e $pasta"/scanner/"$1"/resultados/resultado_SQLMAP.txt" ];then
    zenity --error --text="SCAN [<SQLMAP/>] NESTE DOMÍNIO JÁ REALIZADO!!";
    exit;
else
    test;
fi




sqlmap -m $pasta"/scanner/"$1"/resultados/paramslimpos.txt" --threads=10 --level=1 --batch --dbs >> $pasta"/scanner/"$1"/resultados/resultado_SQLMAP.txt";

bash;
