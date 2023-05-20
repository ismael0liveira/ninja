#!/bin/bash

dominio=$(zenity --forms    \
        --title="Formulário"    \
        --text="Formulário Hacking" \
        --add-entry="Dominio" \
        --separator="," \
        --ok-label="Hackear"
);

pasta=$(pwd);

if [ -e $pasta"/scanner/"$dominio"/resultados/subsResolvidos.txt" ];then
    test;
else
    zenity --error --text="REALIZE O RECONHECIMENTO PRIMEIRAMENTE!!";
    exit;
fi

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<SCAN ARACHINI />>\033[m\n";
echo "cd /home/ninja/Downloads/scan/arachni-1.6.1.3-0.6.1.1/bin/;./arachini_web";

su ninja;

bash;



