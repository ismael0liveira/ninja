#!/bin/bash

url=$1;
cd ../;
pasta=$(pwd);
res=$(echo $url | httprobe);


if [ -e $pasta"/scanner/"$url"/resultados/scanZap" ];then
    sair=$(zenity --forms   \
    	--title="SCANNER OWASP ZAP" \
        --text="SCAN DESTE SUB[DOMÍNIO] JÁ REALIZADO!!" \
        --ok-label="OK"
	)
	exit;
else

	data=$(date +"%H:%M:%S");
	echo -e "\033[1;34;40m"$data"\033[m \033[33;1m Opções: "$res"\033[m\n";
	sleep 3;
	resolvido=$(zenity --forms    \
        --title="Formulário"    \
        --text="Digite o domínio: " \
        --add-entry="[sub]domínio: " \
        --separator="," \
        --ok-label="Hackear"
	);

	mkdir $pasta"/scanner/"$url"/resultados/scanZap"


	echo -e "#!/bin/bash\n\nbash /usr/share/zaproxy/zap.sh -daemon -quickurl "$resolvido" -quickout "$pasta"/scanner/"$url"/resultados/scanZap/bugscan-"$url".md -quickprogress" > $pasta"/scanner/"$url"/resultados/scanZap/scan"$url.sh;

	chmod 777 $pasta"/scanner/"$url"/resultados/scanZap/scan"$url.sh;

	cd $pasta"/scanner/"$url"/resultados/scanZap/";
	pwd
	./"scan"$url.sh;
fi
