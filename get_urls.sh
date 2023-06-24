#!/bin/bash

pasta=$(pwd);

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<THREADS - GET URLS />>\033[m\n";


for n in $(seq 1 100);do
	for url in $(cat $pasta"/scanner/"$1"/resultados/subsResolvidos.txt" | sed 's/http.*\/\///');do
		curl "https://otx.alienvault.com/api/v1/indicator/hostname/"$url"/url_list?limit=500&page="$n -s | jq -r ".url_list" | jq .[].url | sed 's/"//' >> $pasta"/scanner/"$1"/resultados/"urls_s.txt &

	echo -e "\n\n\033[32;1mTESTANDO: \033[m https://otx.alienvault.com/api/v1/indicator/hostname/"$url"/url_list?limit=500&page="$n"\n";
	done;
done;

for url in $(cat $pasta"/scanner/"$1"/resultados/subsResolvidos.txt" | sed 's/http.*\/\///');do
	echo -e "\n\n\033[32;1mTESTANDO: \033[m"$url"\n\n";
	curl "http://web.archive.org/cdx/search/cdx?url="$url"*&output=txt" -s | awk -F " " '{print $3}' | sort -u >> $pasta"/scanner/"$1"/resultados/"urls_s.txt &
done

bash;
