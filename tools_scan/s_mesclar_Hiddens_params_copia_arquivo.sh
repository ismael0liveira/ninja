#!/bin/bash

read -p "Digite o domínio: " dominio;
cd ../;
pasta=$(pwd);

cp $pasta"/scanner/"$dominio"/resultados/subsResolvidos.txt" .


