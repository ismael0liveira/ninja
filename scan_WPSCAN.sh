#!/bin/bash

pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/scannerWordpress.txt" ];then

    sair=$(zenity --forms   \
        --title="SCANNER WORDPR3SS" \
        --text="SCAN DESTE SUB[DOMÍNIO] JÁ REALIZADO!!" \
        --ok-label="OK"
    )
    exit;
else
	test;
fi


tamanho=$(wc -l $pasta"/scanner/"$1"/resultados/"analiseWordpress.txt | awk -F " " '{ printf $1 }');

echo -e "\033[05;33m<<A QUANTIDADE DE URLS É:"$tamanho" />\033[00;37m"

echo -e "\n\033[33;1mVocê deseja realizar scan de WORDPRESS?\033[m";
read -p "Resposta [s/n]: " resposta;
case $resposta in
    "s")
        echo -e "\n\033[33;1mScaneando Wordpress [wpscan]...\033[m";
        sleep 2;
        pasta=$(pwd);
        for url in $(cat $pasta"/scanner/"$1"/resultados/"analiseWordpress.txt);do

            echo -e "\n\033[33;1mVocê deseja realizar scan de "$url"?\033[m";
            read -p "Resposta: [s/n]: " resposta;

            case $resposta in
                's')
                    wpscan --no-update --url $url --enumerate ap, vt, cb --random-user-agent >> $pasta"/scanner/"$1"/resultados/"scannerWordpress.txt;;
                'n')
                    echo "Ok, vamos prosseguir...";;
                *)
                    echo "Não entendi, vamos prosseguir...";
                esac;
        done;;

    "n")
        echo -e "\033[33;1mOk, vamos prosseguir...\033[m";;

    *)
        echo -e "\033[33;1mDesculpe-me, não entendi, vamos continuar...\033[m";;
        #Aqui foi colocado dois ponto e vírgula por conta do case acima.
    esac



