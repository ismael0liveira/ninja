#!/bin/bash

caminho=$(pwd);

if [ -e $caminho"/scanner/"$1"/resultados/subs.txt" ];then
	terminator -e "echo '\033[31;1mSCAN NESTE DOMÍNIO JÁ FOI REALIZADO!!\033[m';bash";
	exit;
else

	cat banners/bannerdois.txt;

	pasta=$(pwd);
	sleep 1;


	#INICIANDO O RECON

	sleep 2;
	data=$(date +"%H:%M:%S");
	echo -e "\033[1;34;40m"$data"\033[m \033[32;1m------------->>>> RECON INICIADO <<<<---------------\033[m";

	sleep 1;

	#Puxando endpoint para uma futura análise

	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[33;1mBuscando endpoints para análise...\033[m";
	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: subsAnaliseEndpoint.txt"
	sleep 2;
	curl -s "https://crt.sh/?q=$1" | grep $1 | sed 's/<TD>//' | sed 's/<\/TD>//' | sort -u | grep -v "<A " | grep -v "Logged" | grep -v "<TH " | grep -v "<TITLE>" | grep -v "<IMG src" | sed 's/<BR>//' | grep -v "<TD class" > $pasta"/scanner/"$1"/resultados/"subsAnaliseEndpoint.txt;

	#Fazendo o recon de subdomínio

	sleep 2;

	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[32;1mRECON DE SUBDOMINIOS\033[m";
	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m Arquivo a ser gerado: subs.txt";
	sleep 1;

	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[32;1mUTILIZANDO FINDOMAIN\033[m";

	findomain -q --output -t $1;
	#arquivo findomain

	findomain=$1".txt";


	mv $findomain $pasta"/scanner/"$1"/resultados";


	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[32;1mUTILIZANDO SUBLIST3R...\033[m"

	sleep 2

	sublist3r -d $1 > "sublister."$1".txt";

	sublister="sublister."$1".txt";

	mv $sublister $pasta"/scanner/"$1"/resultados";




        data=$(date +"%H:%M:%S");
    	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mUTILIZANDO SUBFINDER...\033[m";

        sleep 2;

        subfinder -d $1 -all -o subfinder.txt;

        subfinder="subfinder.txt";

        mv $subfinder $pasta"/scanner/"$1"/resultados/";

	
        data=$(date +"%H:%M:%S");
    	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mUTILIZANDO ASSETFINDER...\033[m";

        sleep 2;

        echo $1 | assetfinder -subs-only > asset.txt;

        assetfinder="asset.txt";

        mv $assetfinder $pasta"/scanner/"$1"/resultados/";




	#ATENÇÃO, ENTRAMOS NA PASTA RESULTADOS DO DOMÍNIO






	cd $pasta"/scanner/"$1"/resultados";

	cat $sublister | grep $1 | grep -v "Enumerating subdomains now for" > sublisterLimpo.txt;

	cat $findomain sublisterLimpo.txt subfinder.txt asset.txt >> subs.txt;
	
	cat subs.txt | sort -u > subs_full.txt;
	rm subs.txt;
	mv subs_full.txt subs.txt;

	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[32;1mAPAGANDO ARQUIVOS ANTIGOS...\033[m";

	sleep 2;

	rm $findomain;
	rm $sublister;
	rm $assetfinder;
	rm $subfinder;
	rm sublisterLimpo.txt;


	#ATENÇÃO, VOLTAMOS PARA O DIRETÓRIO RAIZ DO PROJETO!!!


	cd ../../;

	function recon {
		cd ../;
		echo "\033[33;1mDIGITE O DOMÍNIO PARA PROSSEGUIR!!\033[m";
		read -p "Domínio: " dominio;

		#_variaveis

		subs="subs.txt";
		subsResolvidos="subsResolvidos.txt";
		pasta=$(pwd);
		duzentos="subsDuzentos.txt";
		proibidos="subsProibidos.txt";
		redirect="subsRedirect.txt";
		SubsDuzentosRedirectProibidos="SubsDuzentosRedirectProibidos.txt";
		TodosParamsPreenchidos="TodosParamsPreenchidos.txt";
		gauParamsRedirects="gauParamsRedirects.txt";
		resolvidosHTTPS="resolvidosHTTPS.txt";
		resolvidos="resolvidosHTTP.txt";

		if [ -e $pasta"/scanner/"$dominio"/resultados/"$subs ];then

			#_variaveis

			pasta=$(pwd);
			subs="subs.txt";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m \033[32;1mRECON UTILIZANDO HTTPX/HTTPROBE\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Arquivos gerados: statusHTTP.txt, subsDuzentos.txt, subsProibidos.txt,resolvidos.txt, subsRedirect.txt, subsResolvidosHTTPS.txt, subsResolvidosHTTP.txt, SubsDuzentosRedirectProibidos.txt";
			sleep 2

			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m \033[32;1m[HTTPX] RESPOSTAS HTTP\033[m" & cat $pasta"/scanner/"$dominio"/resultados/"$subs\
			| httpx -silent -status-code -o $pasta"/scanner/"$dominio"/resultados/"statusHTTP.txt & echo -e "\033[1;34;40m"$data"\033[m \033[32;1m[HTTPX] DUZENTOS\033[m" & cat \
			$pasta"/scanner/"$dominio"/resultados/"$subs | httpx -silent -mc 200,201,202,203,204,205,206 -o $pasta"/scanner/"$dominio"/resultados/"subsDuzentos.txt & echo -e \
			"\033[1;34;40m"$data"\033[m \033[32;1m[HTTPX] PROIBIDOS\033[m" & cat $pasta"/scanner/"$dominio"/resultados/"$subs | httpx \
			-silent -mc 401,403,405,409,411,451 -o $pasta"/scanner/"$dominio"/resultados/"subsProibidos.txt & echo -e \
			"\033[1;34;40m"$data"\033[m \033[32;1m[HTTPROBE] RESOLVENDO DOMINIOS/SUBDOMINIOS\033[m" & cat \
			$pasta"/scanner/"$dominio"/resultados/"$subs | httprobe > $pasta"/scanner/"$dominio"/resultados/"subsResolvidos.txt & cat \
            $pasta"/scanner/"$dominio"/resultados/"$subs | httpx -silent -mc 300,301,302,303,304,307,308 -o $pasta"/scanner/"$dominio"/resultados/"subsRedirect.txt;


			#gerando arquivos únicos com HTTP e HTTPS

			cat $pasta"/scanner/"$dominio"/resultados/"subsResolvidos.txt | grep "https://" > $pasta"/scanner/"$dominio"/resultados/"subsResolvidosHTTPS.txt;
			cat $pasta"/scanner/"$dominio"/resultados/"subsResolvidos.txt | grep "http://" > $pasta"/scanner/"$dominio"/resultados/"subsResolvidosHTTP.txt;

			#Mesclando duzentos, redirect e proíbidos.

			data=$(date +"%H:%M:%S");
            echo -e "\033[1;34;40m"$data"\033[m \033[32;1mMesclando resolvidos duzentos, redirect e proíbidos...\033[m";
			sleep 2;

			cat $pasta"/scanner/"$dominio"/resultados/"$duzentos $pasta"/scanner/"$dominio"/resultados/"$proibidos $pasta"/scanner/"$dominio"/resultados/"$redirect | sort -u > $pasta"/scanner/"$dominio"/resultados/"SubsDuzentosRedirectProibidos.txt;
			sleep 2;




			#MODIFICADO

		 
	    echo -e "\033[32;1mESCOLHA UMA OPÇÃO PARA COLETAR URLS";
	    read -p "[EXPERIMENTAL] SCAN DE URLS NINJA(1) / GAU(2) // [1/2]: " resposta;

	    case $resposta in
	    	"1")

				echo "\033[33;1mDIGITE O DOMÍNIO PARA PROSSEGUIR!!\033[m";
				read -p "Domínio: " dominio;


				diretorio=$(pwd);
				touch $diretorio"/scanner/"$dominio"/resultados/"urls_s.txt;
				terminator -e "./get_urls.sh "$dominio &
				terminator -e "tail -f "$diretorio"'/scanner/'"$dominio"'/resultados/urls_s.txt'" &
				sleep 4;
				clear;
				echo -e "\n\n\n\033[32;1mAGUARDE as Threads Finalizarem e cofirme com 's'\033[m\n\n\n";
				read -p "Confirme [s]: " confirma;
				case $resposta in
        			's')
                			test;;
        			*)
                			test;;
        			esac

			cat $diretorio"/scanner/"$dominio"/resultados/"urls_s.txt | sort -u > $diretorio"/scanner/"$dominio"/resultados/"urls_full.txt;
			rm $pasta"/scanner/"$dominio"/resultados/urls_s.txt";		

	    		echo -e "\033[32;1mRECON DE URLS CONCLUÍDO\033[m";;
		"2")
			#Passando GAU
			subsResolvidos="subsResolvidos.txt";

			data=$(date +"%H:%M:%S");
            		echo -e "\033[1;34;40m"$data"\033[m \033[06;33;1m<<PASSANDO GAU/>\033[00;10m";
			sleep 2;
			data=$(date +"%H:%M:%S");
    			echo -e "\033[1;34;40m"$data"\033[m Apenas uma observação: Ao não executar o GAU, será impossibilitado de filtrar parâmetros e Análise de URLS...";
			data=$(date +"%H:%M:%S");
    			echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: gau.txt";

			if [ -e $pasta"/scanner/"$dominio"/resultados/"$subsResolvidos ];then
				cat $pasta"/scanner/"$dominio"/resultados/"$subsResolvidos | gau --threads 70 | sort -u > $pasta"/scanner/"$dominio"/resultados/"gau.txt;
			else
				data=$(date +"%H:%M:%S");
    			echo -e "\033[1;34;40m"$data"\033[m \033[32;1mDesculpe-me, não encontrei $subs para executar GAU...\033[m"
			fi;;
	        *)
		esac



            #Passando HAKRAWLER

			data=$(date +"%H:%M:%S");
            echo -e "\033[1;34;40m"$data"\033[m \033[06;33;1m<HAKRAWLER EM EXECUÇÃO/>>>\033[00;10m";
			sleep 2;
            data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Observação: Ao não executar HAKRAWLER, será impossibilitado de filtrar parâmetros por HAKRAWLER a análise de URLS...";
            data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: hakraw.txt";

            if [ -e $pasta"/scanner/"$dominio"/resultados/"$subsResolvidos ];then
            	cat $pasta"/scanner/"$dominio"/resultados/"$subsResolvidos | hakrawler | sort -u > $pasta"/scanner/"$dominio"/resultados/"hakrawSujo.txt; cat $pasta"/scanner/"$dominio"/resultados/"hakrawSujo.txt | grep -e ^http.*.$dominio > $pasta"/scanner/"$dominio"/resultados/"hakraw.txt; rm $pasta"/scanner/"$dominio"/resultados/"hakrawSujo.txt;
            else
                data=$(date +"%H:%M:%S");
    			echo -e "\033[1;34;40m"$data"\033[m \033[32;1mDesculpe-me, não encontrei $subsResolvidos para executar hakrawler...\033[m";
            fi



		else

			data=$(date +"%H:%M:%S");
            echo -e "\033[1;34;40m"$data"\033[m \033[32;1mO ARQUIVO subs.txt não foi criado, quer continuar?\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Estou em: "$pasta;
			read -p "Confirma [s/n]: " resposta;

			case $resposta in
				"s")
					data=$(date +"%H:%M:%S");
            		echo -e "\033[1;34;40m"$data"\033[m Okay, vamos continuar";;
				"n")
					data=$(date +"%H:%M:%S");
            		echo -e "\033[1;34;40m"$data"\033[m Repita o processo por favor."
					exit;;
				*)
					data=$(date +"%H:%M:%S");
            		echo -e "\033[1;34;40m"$data"\033[m Por favor insira um valor valido"
					exit;;
				esac
		fi

		#Todo Recon de parâmetro será dentro deste bloco de código















		#MODIFICADO






		#filtrar parâmetros com GAU

		sleep 2;
		data=$(date +"%H:%M:%S");
        echo -e "\033[1;34;40m"$data"\033[m \033[32;1m RECON DE PARÂMETROS!!\033[m";
		sleep 2;

		data=$(date +"%H:%M:%S");
        echo -e "\033[1;34;40m"$data"\033[m \033[32;1m <<Recon de parâmetros//>>>\033[m";


		data=$(date +"%H:%M:%S");
        echo -e "\033[1;34;40m"$data"\033[m \033[32;1m Mesclando URLS...\033[m";
		data=$(date +"%H:%M:%S");
		sleep 2;
		caminho=$(pwd)

		if [ -e $caminho"/scanner/"$dominio"/resultados/"gau.txt ];then
			cat $caminho"/scanner/"$dominio"/resultados/"gau.txt $caminho"/scanner/"$dominio"/resultados/"hakraw.txt| sort -u > $caminho"/scanner/"$dominio"/resultados/"urls.txt;
			echo -e "\033[1;34;40m"$data"\033[m Arquivo a ser gerado: urls.txt";
		fi

		if [ -e $pasta"/scanner/"$dominio"/resultados/urls_full.txt" ];then
			 cat $caminho"/scanner/"$dominio"/resultados/"urls_full.txt $caminho"/scanner/"$dominio"/resultados/"hakraw.txt | sort -u > $caminho"/scanner/"$dominio"/resultados/"urls.txt;
			 echo -e "\033[1;34;40m"$data"\033[m Arquivo a ser gerado: urls.txt";
		fi
		sleep 2;

		#Definindo variável para URLS
		urls_full="urls.txt"

		#_variaveis

        caminho=$(pwd);

        if [ -e $caminho"/scanner/"$dominio"/resultados/"$urls_full ];then

			#_variaveis

			pasta=$(pwd);
			urls_full="urls.txt"

			#Guardando lista de parâmetros, mesmo que estão sujos, isto ajuda em análises futuras
            sleep 2;

            data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mFiltrando da lista GAU + HAKRAWLER todos parâmetros, sem excessão (preenchidos)...\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: TodosParamsPreenchidos.txt"
            sleep 2;

			cat $pasta"/scanner/"$dominio"/resultados/"$urls_full | grep "=" | sort -u > $pasta"/scanner/"$dominio"/resultados/"TodosParamsPreenchidos.txt;

            #Gerando uma lista de params para analisar depois para busca de idor ou alguma outra vulnerabilidade
            sleep 2;

            data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mGerando lista de parâmetros para análise...\033[m";
            data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Atenção: Esta enumeração é feita de acordo com o arquivo listaReconParams.txt";
            sleep 2;

            if [ -e $pasta"/scanner/"$dominio"/resultados/"TodosParamsPreenchidos.txt ];then

            	for param in $(cat tools_scan/listaReconParams.txt);do
                	cat $pasta"/scanner/"$dominio"/resultados/"TodosParamsPreenchidos.txt| grep $param >> $pasta"/scanner/"$dominio"/resultados/"AnaliseParams.txt;
                done
            else
            	data=$(date +"%H:%M:%S");
        		echo -e "\033[1;34;40m"$data"\033[m \033[31;1mAtenção: Não foi encontrado o arquivo TodosParamsPreenchidos.txt, vamos continuar...\033[m";
            fi

			sleep 2;


			data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mLista de parâmetros limpos...\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: paramslimpos.txt";
			sleep 2;

            cat $pasta"/scanner/"$dominio"/resultados/"$urls_full | grep "=" | sed 's/=.*/=/' > $pasta"/scanner/"$dominio"/resultados/"paramRepetido.txt;
            cat $pasta"/scanner/"$dominio"/resultados/"paramRepetido.txt | sort -u | grep -v ".css" | grep -v ".js" | grep $dominio > $pasta"/scanner/"$dominio"/resultados/"paramslimpos.txt;
            rm $pasta"/scanner/"$dominio"/resultados/"paramRepetido.txt;

			#Filtrando parâmetros sujos para os que estão funcionando em 200, 301, 302, 403

            data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1m<<<HTTPX PARA FILTRAR PARAMS DUZENTOS, redirect, proíbidos e erros do servidor  da lista gerada/>>>\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Observação: Serão parâmetros preenchidos";


			#_variaveis

            data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mOk, executando HTTPX...\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Respostas a serem capturadas: 200,201,202,203,204,205,206,300,301,302,303,304,307,308,401,403,405,409,411,451,500,501,505,506,507,508,510,511";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: gauHakrawParamsDuzentosRedirectProibidosServer.txt/LIMPO ";
            caminho=$(pwd);

            if [ -e $caminho"/scanner/"$dominio"/resultados/"$urls_full ];then
            	cat $pasta"/scanner/"$dominio"/resultados/"$urls_full | grep "=" | httpx -silent -status-code -mc 200,201,202,203,204,205,206,300,301,302,303,304,307,308,401,403,405,409,411,451,500,501,505,506,507,508,510,511 -o $pasta"/scanner/"$dominio"/resultados/"gauHakrawParamsDuzentosRedirectProibidosServer.txt;
				cat $pasta"/scanner/"$dominio"/resultados/"gauHakrawParamsDuzentosRedirectProibidosServer.txt | awk -F " " '{print $1}' > $pasta"/scanner/"$dominio"/resultados/"gauHakrawParamsDuzentosRedirectProibidosServerLIMPO.txt;
            else
            	data=$(date +"%H:%M:%S");
    			echo -e "\033[1;34;40m"$data"\033[m Nao encontrei o $urls_full para filtrar os parâmetros...";
            fi


            #Filtrando apenas parâmetros redirect

            data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1m<<HTTPX PARA FILTRAR PARAMS LIMPOS redirects da lista gerada/>>>\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Respostas HTTP a capturar: 300,301,302,303,304,307,308";
			#_variaveis

            data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mOk, executando HTTPX...\033[m";
			data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: gauHakrawParamsRedirects.txt";
            caminho=$(pwd);
            paramsLimpos="paramslimpos.txt";

            if [ -e $caminho"/scanner/"$dominio"/resultados/"$paramsLimpos ];then
            	cat $pasta"/scanner/"$dominio"/resultados/"paramslimpos.txt| httpx -silent -mc 300,301,302,303,304,307,308 -o $pasta"/scanner/"$dominio"/resultados/"gauHakrawParamsRedirects.txt;
            else
            	echo "Nao encontrei o paramslimpos.txt para HTTPX...";
            fi


			#Filtrando parâmetros duzentos

            data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1m<<HTTPX PARA FILTRAR PARAMS LIMPOS DUZENTOS da lista gerada/>>>\033[m";

			data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m Arquivo gerado: gauHakrawParamsDuzentos.txt";

			#_variaveis

            caminho=$(pwd);
            paramsLimpos="paramslimpos.txt";

            if [ -e $caminho"/scanner/"$dominio"/resultados/"$paramsLimpos ];then
            	cat $pasta"/scanner/"$dominio"/resultados/"paramslimpos.txt| httpx -silent -mc 200,201,202,203,204,205,206 -o $pasta"/scanner/"$dominio"/resultados/"gauHakrawParamsDuzentos.txt;
           	else
            	data=$(date +"%H:%M:%S");
        		echo -e "\033[1;34;40m"$data"\033[m Nao encontrei o paramslimpos.txt para HTTPX..."
            fi

		else
			data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m Infelizmente não encontrei o arquivo gau+hakraw.txt";
		fi
	}


    data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[32;1mVocê deseja prosseguir?\033[m";
    read -p "Confirma [s/n]: " resposta;

    case $resposta in
        's')
			recon;;
    	'n')
			exit;;

    	*)
        	data=$(date +"%H:%M:%S");
        	echo -e "\033[1;34;40m"$data"\033[m \033[32;1mProsseguindo...\033[m"
        	recon;;
    	esac



	#passando hiddens e uploads


	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[32;1m<<HIDDENS e UPLOADS/>>>\033[m";

	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m Arquivos gerados: inputsHiddens.txt, inputsUploads.txt";

	#_variaveis

	caminho=$(pwd);
	resolv="subsResolvidos.txt";

	if [ -e $caminho"/scanner/"$1"/resultados/"$resolv ];then

		#_variaveis
		pasta=$(pwd);

		python3 tools_scan/scan_hiddens.py;

    	for url in $(cat $pasta"/scanner/"$1"/resultados/"subsResolvidos.txt);do python3 tools_scan/scan_upload.py $url;done >> $pasta"/scanner/"$1"/resultados/"inputsUploads.txt;


   	else
    		data=$(date +"%H:%M:%S");
    		echo -e "\033[1;34;40m"$data"\033[m Nao encontrei o subsResolvidos.txt para hiddens e uploads..."
	fi


	#parei_aqui


	#Análise de URLS


	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m \033[32;1mAnalisando URLS por lista gerada de GAU + HAKRAWLER...\033[m";
	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m Atenção: Esta análise é realizada com base em listaReconURLS.txt";
	data=$(date +"%H:%M:%S");
    echo -e "\033[1;34;40m"$data"\033[m Arquivo a ser gerado: analiseURLS.txt";
	sleep 2
	for analiseUrls in $(cat tools_scan/listaReconURLS.txt);do
		cat $caminho"/scanner/"$1"/resultados/"urls.txt| grep $analiseUrls >> $caminho"/scanner/"$1"/resultados/"analiseURLS.txt;
	done
fi

bash;
