#!/bin/bash

user=$(whoami);
caminho=$(pwd);

if [ $user != "root" ];then
  echo -e "\033[41;1mVocê não é usuário root, por favor, entre como Root e depois execute\033[m \033[42;1mninja.sh\033[m";
  sudo su;
  exit;
fi;

if [ -e $caminho"/scanner/"$1"/resultados/analiseWordpress.txt" ];then
	zenity --error --text="SCAN NESTE DOMÍNIO JÁ REALIZADO!!";
    exit;
else
	test;
fi

#_variaveis pasta e dominio
pasta=$(pwd);
dominiores=$(echo $1 | httprobe);
conta=$(echo $1 | sed 's/ /\n/' | wc -l);
dominioresolvido=$(if [ $conta != 1 ];then echo $1 | sed 's/ /\n/' | grep "https";fi)
sleep 2;


#SCAN DE TECNOLOGIAS
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANEANDO TECNOLOGIAS/>\033[00;37m";
./scan_TECHNOLOGYS.sh $1;


#SCAN WORDPRESS
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANEANDO URLS COLETADAS PARA WORDPRESS/>\033[00;37m";
echo "Arquivo a ser gerado: analiseWordpress.txt";
cat $pasta"/scanner/"$1"/resultados/"gauAndHakraw.txt | grep "wp-" | sed 's/wp-.*//' | sort -u >> $pasta"/scanner/"$1"/resultados/"analiseWordpress.txt;


#Buscando Open Redirect
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<< [THREADS] SCANEANDO OPEN REDIRECT/>\033[00;37m";
./thread_OPEN_REDIRECT.sh $1;


#Buscando Local File Inclusion
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<< [THREADS] SCANEANDO LOCAL FILE INCLUSION/>\033[00;37m";
./thread_LFI.sh $1;


#Buscando Local Remote File Inclusion
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<< [THREADS] SCANEANDO REMOTE FILE INCLUSION/>\033[00;37m";
./thread_RFI.sh $1;


#Buscando Method PUT Enable
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<< [THREADS] SCANEANDO METHOD PUT ENABLE/>\033[00;37m";
./thread_PUT.sh $1;


#Buscando HTTP SMUGGLING
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<HTTP SMUGGLING - SMUGGLING/>\033[00;37m";
terminator -e "bash scan_SMUGGLER.sh "$1 &


#Buscando LOG 4SHELL
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<LOG 4SHELL - /LogMePwn/>\033[00;37m";
terminator -e "bash scan_LOG4SHELL.sh "$1 &


#SCAN DE VULNERABILIDADES - VULMAP
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCAN DE VULNERABILIDADES - VULMAP/>\033[00;37m";
terminator -e "bash scan_VULMAP.sh "$1 &


#SCAN WEBDAV - DAVTEST
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANEANDO WEBDAV - DAVTEST/>\033[00;37m";
terminator -e "bash scan_DAVTEST.sh "$1 &

#SCAN RCE PHP - BACKDOOR PHP 8.1.0
data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<<SCANEANDO RCE PHP (8.1.0) - BACKDOOR/>\033[00;37m";
terminator -e "bash scan_RCEPHP.sh "$1 &

bash;
