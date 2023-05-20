#!/bin/bash

pasta=$(pwd);

dominio=$(zenity --forms    \
	--title="Formulário"    \
    --text="Formulário Hacking" \
    --add-entry="Dominio" \
    --separator="," \
    --ok-label="Hackear"
    );

cat hiddens_nao_mesclados.txt $pasta"/scanner/"$dominio"/resultados/paramslimpos.txt" | sort -u > $pasta"/scanner/"$dominio"/resultados/temporario.txt";
rm $pasta"/scanner/"$dominio"/resultados/paramslimpos.txt";
mv $pasta"/scanner/"$dominio"/resultados/temporario.txt" $pasta"/scanner/"$dominio"/resultados/paramslimpos.txt";

rm subsResolvidos.txt;
rm hiddens_nao_mesclados.txt;
