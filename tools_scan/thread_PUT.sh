#!/bin/bash

cd ../;
pasta=$(pwd);

for url in $(cat $pasta"/scanner/"$1"/resultados/subsResolvidos.txt");do
	arquivo=$(echo $url | sed 's/http.*.\/\///');

        echo 'curl -X PUT --silent "'$url'" -d "<h1>Test Bug Bounty</h1>" -v 2>&1 | grep "HTTP.*.201" && echo -e '$url'"\033[33;1m METHOD PUT ENABLE - VULNERÁVEL \033[m" >> resultado_thread_put.txt &'>> $pasta"/scanner/"$1"/resultados/curlsMontados";
done

mkdir $pasta"/scanner/"$1"/resultados/resultaHTTPPUT";
mv $pasta"/scanner/"$1"/resultados/curlsMontados" $pasta"/scanner/"$1"/resultados/resultaHTTPPUT/";
cd $pasta"/scanner/"$1"/resultados/resultaHTTPPUT";

qtd=$(cat $pasta"/scanner/"$1"/resultados/resultaHTTPPUT/curlsMontados" | wc -l);
for (( i=0; i<=$qtd; i++ ));do
        echo -e "#!/bin/bash\n" >> "executa"$i".sh";

        cat $pasta"/scanner/"$1"/resultados/resultaHTTPPUT/curlsMontados" --number | grep " "$i | sed "s/ $i//" >> "executa"$i".sh";
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
