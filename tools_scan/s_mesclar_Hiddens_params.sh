#!/bin/bash

cd ../;
pasta=$(pwd);
read -p "Digite o domínio: " dominio;
cat hiddens_nao_mesclados.txt $pasta"/scanner/"$dominio"/resultados/paramslimpos.txt" | sort -u > $pasta"/scanner/"$dominio"/resultados/temporario.txt";
rm $pasta"/scanner/"$dominio"/resultados/paramslimpos.txt";
mv $pasta"/scanner/"$dominio"/resultados/temporario.txt" $pasta"/scanner/"$dominio"/resultados/paramslimpos.txt";

rm subsResolvidos.txt;
rm hiddens_nao_mesclados.txt;
