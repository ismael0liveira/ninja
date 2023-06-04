#!/bin/bash

dominio=$(zenity --forms    \
    --title="Formulário"    \
    --text="Formulário Hacking" \
    --add-entry="Dominio" \
    --separator="," \
    --ok-label="Hackear"
    );

cd ../;
pasta=$(pwd);

cp $pasta"/scanner/"$dominio"/resultados/subsResolvidos.txt" .


