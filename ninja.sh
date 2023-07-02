#!/bin/bash

function banner {

    clear;
    echo -e "\033[06;31;1m";
    cat banners/bannerCinco.txt;
    echo -e "\033[00;10m";
	python3 banners/banner.py;
    sleep 1;
    echo -e "\033[33;1mBy: Ismael Oliveira\033[m";
    echo -e "\033[31;1mAlvo: "$dominio" \033[m";
    sleep 1;
	cat banners/banner_lista.txt;
}

banner;
echo -e "\n\033[33;1mPara prosseguir, digite o dominio do Alvo\033[m";

echo -e "\n\n\033[33;1mDIGITE O DOMÍNIO PARA PROSSEGUIR!!\033[m";
read -p "Domínio: " dominio;

pasta=$(pwd);

if [ -e $pasta"/scanner/"$dominio ];then
	test
else
	mkdir $pasta"/scanner/"$dominio;
	mkdir $pasta"/scanner/"$dominio"/resultados";
	chmod 777 -R $pasta"/scanner/"$dominio"/resultados";
fi

if [ -e $pasta"/scanner/"$dominio"/resultados/plataforma.txt" ];then
        test
else
	echo -e "\n\n\033[33;1mDIGITE A PLATAFORMA PARA PROSSEGUIR!!\033[m";
	read -p "Domínio: " plataforma;
	echo "Este programa "$dominio" faz parte da plataforma: "$plataforma > $pasta"/scanner/"$dominio"/resultados/plataforma.txt";

fi


um="1";
while [ $um == "1" ];do

	read -p "H4CK3D: " resposta;

	case $resposta in
		'1')
			terminator -e  "./recon.sh $dominio" &
			banner;;
		'2')
			terminator -e  "./scanner.sh $dominio && bash" &
			banner;;
	        '3')
            		terminator -e "cd tools_scan/;./scan_manual_lista.sh && bash" &
            		banner;;
		'4')
			terminator -e  "cd tools_scan/;./scan_GOWITNESS.sh $dominio" &
			banner;;
		'5')
			terminator -e  "cd tools_scan/;./scan_WPSCAN.sh $dominio" &
			banner;;
		'6')
			echo "\033[33;1mDIGITE O DOMÍNIO OU SUBDOMÍNIO DE "$dominio" PARA PROSSEGUIR!!\033[m";
			read -p "Domínio: " zap;

			terminator -e  "cd tools_scan/;./scan_ZAP.sh $zap" &
			banner;;
		'7')
			terminator -e  "cd tools_scan/;./scan_TPLMAP.sh $dominio" &
			banner;;
		'8')
			terminator -e  "cd tools_scan/;./scan_VULN_POCBOMBER.sh $dominio" &
			banner;;
		'9')
			terminator -e  "cd tools_scan/;./scan_PWNXSS.sh $dominio" &
			banner;;
		'10')
			terminator -e  "cd tools_scan/;./scan_TAKEOVER.sh $dominio" &
			banner;;
		'11')
			terminator -e  "cd tools_scan/;./scan_SQLMAP.sh $dominio" &
			banner;;
		'12')
			terminator -e "cd tools_scan/;./scan_burp.sh" &
			banner;;
                '13')
                        terminator -e "cd tools_scan/;./scan_OPEN_REDIRECT.sh $dominio" &
                        banner;;
                '14')
                        terminator -e "cd tools_scan/;./scan_CORS.sh $dominio" &
                        banner;;

                '15')
                        terminator -e "cd tools_scan/;./scan_CRLF.sh $dominio" &
                        banner;;
		'16')
			terminator -e "cd tools_scan/;./scan_ARACHNI.sh" &
			banner;;
		*)
			banner;;
	esac


done
