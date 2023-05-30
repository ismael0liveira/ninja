#!/bin/bash


echo -e "\033[32;1m\n\n SCANN3R \n\n\033[m";

pasta=$(pwd);



<<comment

****************************************************

		SCAN DE TECNOLOGIAS

****************************************************

Dependência:

https://github.com/CERN-CERT/WAD

comment


diretorio=$(pwd);    
for url in $(cat $1"/resultados/subsResolvidos.txt");do     
    echo -e "\033[32;1m\n\nURL: "$url"\033[m\n" >> $pasta"/scanner"$1"/resultados/scan_technologys.txt";     
    python3 $diretorio"/"tool_WAD/wad/__main__.py -u $url >> $pasta"/scanner/"$1"/resultados/scan_technologys.txt";       
done & 




<<comment


***********************************************

		SCAN DE CMS

***********************************************

Dependência: Arquivo "TodosParamsPreenchidos.txt"


comment


echo -e "\033[32;1m\n\n CMS SCAN \n\n\033[m";


echo -e "\033[32;1m\n\n SCAN DE WORDPRESS \n\n\033[m" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "wp-" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "WP-" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "wordpress" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "WORDPRESS" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";



echo -e "\033[32;1m\n\n SCAN DE JOOMLA \n\n\033[m" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "joomla" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";


cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "JOOMLA" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "Joomla" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";




echo -e "\033[32;1m\n\n SCAN DE DRUPAL \n\n\033[m" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "drupal" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "DRUPAL" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";


cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "Drupal" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";





echo -e "\033[32;1m\n\n SCAN DE MAGENTO \n\n\033[m" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "magento" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "MAGENTO" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "Magento" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "skin/frontend" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";





echo -e "\033[32;1m\n\n SCAN DE TYPO3  \n\n\033[m" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "typo3" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "TYPO3" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "Typo3" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";

cat $pasta"/scanner/"$1"/resultados/TodosParamsPreenchidos.txt" | grep "typo3conf" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";
echo -e "\n\n\n\n" >> $pasta"/scanner/"$1"/resultados/cmsDetected.txt";




