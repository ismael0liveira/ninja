#!/bin/bash

echo "\033[33;1mDIGITE O DOMÍNIO PARA CONTINUAR!!\033[m";
read -p "Domínio: " dominio;
cd ../;
pasta=$(pwd);

cp $pasta"/scanner/"$dominio"/resultados/subsResolvidos.txt" .


