#!/bin/bash

#Aqui abaixo eu gero a lista de One-Liners com as URLS dos domínios/subdomínios a serem testados

for url in $(cat analiseWordpress.txt);do
	#Aqui é gerado um arquivo de texto que salva o resultado do curl feito na URL
	#Aqui é substituído tudo que for http.algumacoisa:// para nada, assim pra gerar um arquivo de texto para essa URL específica
	#Depois eu uso esse arquivo de URL pra salvar o resultado do CURL criado
	echo $url | sed 's/http.*.\/\///' | xargs touch ;
	arquivo=$(echo $url | sed 's/http.*.\/\///');

	#Aqui também é gerado um arquivo com todos os CURLS montados com as URLS do arquivo analiseWordpress.txt
	#O arquivo curlsMontados fica sem o .txt no final porque depois é dado um cat em todos arquivos .txt pra salvar
	#os resultados de todos os curls, então se ele tiver o .txt no final ele também será jogado no cat.

        echo 'curl --silent "'$url'/?rest_route=/wp/v2/users/1" | grep "\{\"id\":" && printf "'$url'\033[33;1m VULNERAVEL\033[m\n\n" > '$arquivo'.txt || printf "'$url'\033[32;1m NAO E VULNERAVEL\033[m\n\n" > '$arquivo'.txt &' >> "curlsMontados";
done

#Aqui eu crio e entro na pasta onde será guardado os resultados dos curls testando o vazamento de usuários wordpress

mkdir resulta;
mv curlsMontados resulta/;
cd resulta;

#Variável qtd é de quantidade
#Aqui abaixo eu gero todos os executáveis curl para testes de wordpress
#Basicamente para cada URL é gerado um arquivo bash executável

#Esse laço FOR abaixo tem a responsabilidade de gerar um arquivo bash
#executável para cada linha existente no arquivo curlsMontados

#Enquanto a variável teste letra i tiver o valor menor ou igual ao número
#de URLS no arquivo curlsMontados crie um arquivo bash para cada linha nesse
#arquivo curlsMontados

qtd=$(cat curlsMontados | wc -l);
for (( i=0; i<=$qtd; i++ ));do
	#Aqui é necessário setar um shebang para cada arquivo
        echo -e "#!/bin/bash\n" >> "executa"$i".sh";
	#Aqui eu jogo pra dentro do arquivo o conteúdo principal que é a One-Liner pra executar o CURL
	#Aqui é feito um grep do número da linha e é feito uma substituição do número da linha
	#Por nada, isso porque essa ideia de grep da linha é só uma gambiarra pra conseguir
	#pegar linha por linha, isso porque sem essa gambiarra fica complicado pegar linha por
	#linha, aí joga um cat numerando cada linha e grepa a linha pelo número dela

        cat curlsMontados --number | grep " "$i | sed "s/ $i//" >> "executa"$i".sh";
done

#Aqui eu gero um arquivo bash para executar todos os arquivos bash existentes nesse diretório
#Mas esse arquivo tem um problema, o problema é que ele joga ele mesmo pra dentro dele, então se
#torna um loop infinito.

echo -e "#!/bin/bash\n" >> executaTudo.sh;

for arquivo in $(echo -e executa*.sh);do
	echo "./"$arquivo" &" >> executaTudo.sh;
done

chmod +x *.sh;

#Pra tirar o loop infinito de executar o próprio executável é gerado um novo arquivo chamado rodaTudo.sh
#Esse arquivo rodaTudo será responsável por executar todos os arquivos bash desse diretório, ou seja: Ele
#Substitui o arquivo executaTudo.sh

cat executaTudo.sh | grep -v "./executaTudo.sh &" > rodaTudo.sh;

rm executaTudo.sh;
chmod +x rodaTudo.sh;
./rodaTudo.sh;

#Uma mensagem de lembrete para ter o arquivo limpo com todos resultados, isso basicamente gera um
#arquivo de texto com os resultados que teve ao executar os arquivos bash das URLS
#Daí eu movo esse arquivo para algum lugar, atualmente penso em criar um diretório que salva todos esses resultados
#De falhas

echo -e "\n\033[33;1mATENÇÃO, É RECOMENDADO EXECUTAR ESTA ONE-LINER ABAIXO APÓS ESTES PROCESSOS EM SEGUNDO PLANO SEREM EXECUTADOS!!\033[m";
pasta=$(pwd);
echo -e "\ncd "$pasta";cat *.txt > resultado.txt;mv resultado.txt ../;cd ../;rm -rf resulta;";
echo -e "\nObservação: Esta One-Liner deve ser executada em: "$pasta;
