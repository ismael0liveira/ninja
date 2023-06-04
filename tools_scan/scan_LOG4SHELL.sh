#!/bin/bash
cd ../;
#Buscando LOG 4SHELL
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<LOG 4SHELL - /LogMePwn/>\033[00;37m";
pasta=$(pwd);

echo -e "\n\033[33;1mPara prosseguir, digite um e-mail\033[m";

dominio=$(zenity --forms    \
        --title="Formulário"    \
        --text="Formulário Hacking" \
        --add-entry="Meu email" \
        --separator="," \
        --ok-label="Hackear"
);

./tool_LOG_4_SHELL/lmp -email $email -file $pasta"/scanner/"$1"/resultados/subs.txt" -threads 100
