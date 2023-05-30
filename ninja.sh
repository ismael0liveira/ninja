#!/bin/bash

function banner {

    clear;
    echo -e "\033[06;31;1m";
    cat banners/bannerCinco.txt;
    echo -e "\033[00;10m";
	python3 banner.py;
    sleep 1;
    echo -e "\033[33;1mBy: Ismael Oliveira\033[m";
    echo -e "\033[31;1mAlvo: "$dominio" \033[m";
    sleep 1;
	cat banner_lista.txt;
}

banner;
echo -e "\n\033[33;1mPara prosseguir, digite o dominio do Alvo\033[m";

dominio=$(zenity --forms    \
        --title="Formulário"    \
        --text="Formulário Hacking" \
        --add-entry="Dominio" \
        --separator="," \
        --ok-label="Hackear"
);
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
	plataforma=$(zenity --forms    \
        	--title="Formulário"    \
        	--text="Formulário Hacking" \
        	--add-entry="Plataforma" \
        	--separator="," \
        	--ok-label="Hackear"
	);
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
			snipp=$(zenity --forms    \
            	--title="Formulário"    \
                --text="Escolha um sub[domínio] de $dominio" \
                --add-entry="Dominio" \
                --separator="," \
                --ok-label="Hackear"
            );

			if [ -e "/usr/share/sn1per/loot/workspace/"$snipp ];then
			    zenity --error --text="SCAN NESTE SUB[DOMÍNIO] POR SN1PER JÁ FOI REALIZADO!!";
    			snip=$(zenity --forms   \
        		--title="SCAN SN1PER JÁ REALIZADO NESTE SUB[DOMÍNIO]" \
        		--text="Deseja realizar novamente? [s/n]" \
        		--add-entry="Resposta" \
        		--separator="," \
        		--ok-label="HACKEAR"
    			)
				case $snip in
					's')
						terminator -e  "sniper -t $snipp -m web && bash" &
						banner;;
					'n')
						banner;;
				esac
			else
				terminator -e  "sniper -t $dominio -m web" &
				banner;
			fi;;
		'4')
			terminator -e  "./scan_GOWITNESS.sh $dominio" &
			banner;;
		'5')
			terminator -e  "./scan_WPSCAN.sh $dominio" &
			banner;;
		'6')
			zap=$(zenity --forms    \
        		--title="Formulário"    \
        		--text="Escolha um sub[domínio] de $dominio" \
        		--add-entry="Dominio" \
        		--separator="," \
        		--ok-label="Hackear"
			);
			terminator -e  "./scan_ZAP.sh $zap" &
			banner;;
		'7')
			terminator -e  "./scan_TPLMAP.sh $dominio" &
			banner;;
		'8')
			terminator -e  "./scan_VULN_POCBOMBER.sh $dominio" &
			banner;;
		'9')
			terminator -e  "./scan_PWNXSS.sh $dominio" &
			banner;;
		'10')
			terminator -e  "./scan_TAKEOVER.sh $dominio" &
			banner;;
		'11')
			terminator -e  "./scan_SQLMAP.sh $dominio" &
			banner;;
		'12')
			terminator -e "./scan_burp.sh" &
			banner;;
                '13')
                        terminator -e "./scan_OPEN_REDIRECT.sh $dominio" &
                        banner;;
                '14')
                        terminator -e "./scan_CORS.sh $dominio" &
                        banner;;

                '15')
                        terminator -e "./scan_CRLF.sh $dominio" &
                        banner;;
		'16')
			terminator -e "./scan_ARACHNI.sh" &
			banner;;
		*)
			banner;;
	esac


done
