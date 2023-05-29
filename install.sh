#!/bin/bash

cat banner_install.txt;
echo -e "\n\033[32;1mBy: Ismael Oliveira\033[m";

user=$(whoami);
if [ $user != "root" ];then
        echo -e "\033[31;1mPor favor, entre como root para prosseguir...\033[m";
        exit;
fi

chmod 777 scanner/;

if [ -e /usr/bin/zenity ];then
        echo -e "\033[32;1mZENITY JÁ INSTALADO\033[m";
else
        echo -e "\n\n\033[32;1m Instalando ZENITY - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install zenity;;
                "2")
                        pacman -Sy zenity;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac
fi


if [ -e /usr/bin/terminator ];then
        echo -e "\033[32;1mTERMINATOR JÁ INSTALADO\033[m";
else
        echo -e "\n\n\033[32;1m Instalando TERMINATOR - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install terminator;;
                "2")
                        pacman -Sy terminator;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac
fi



if [ -e /usr/bin/sublist3r ];then
        echo -e "\033[32;1mSUBLIST3R Já Instalado...\033[m";
else
        echo -e "\n\n\033[32;1m Instalando SUBLIST3R - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install sublist3r -y;;
                "2")
                        pacman -Sy sublist3r;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac
fi




echo -e "\n\n\033[33;1mGOLANG \033[m";

if [ -e /usr/bin/go ];then
        echo -e "\033[32;1mGOLANG JÁ INSTALADO...\033[m";
else
        echo -e "\n\n\033[32;1m Instalando GOLANG - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install golang -y;;
                "2")
                        pacman -Sy golang;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac

fi

echo -e "\n\n\033[33;1mPIP3 \033[m";

if [ -e /usr/bin/pip3 ];then
        echo -e "\033[32;1mPIP3 JÁ INSTALADO...\033[m";
else
        echo -e "\n\n\033[32;1m Instalando PIP3 - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install python3 -y;
                        apt install python3-pip -y;;
                "2")
                        pacman -Sy python3;
                        pacman -Sy python3-pip;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac

fi


echo -e "\n\n\033[33;1mCURL \033[m";

if [ -e /usr/bin/curl ];then
        echo -e "\033[32;1mCURL JÁ INSTALADO...\033[m";
else
        echo -e "\n\n\033[32;1m Instalando CURL - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install curl -y;;
                "2")
                        pacman -Sy curl -y;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac

fi


echo -e "\n\n\033[33;1mFINDOMAIN \033[m";

if [ -e /usr/bin/findomain ];then
        echo -e "\033[32;1mFINDOMAIN JÁ INSTALADO\033[m";
else
        curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip;
        chmod 777 findomain;
        mv findomain /usr/bin/;
        rm findomain-linux-i386.zip;
fi

echo -e "\n\n\033[33;1mSUBFINDER \033[m";

if [ -e /usr/bin/subfinder ];then
        echo -e "\033[32;1mSUBFINDER JÁ INSTALADO\033[m";
else
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest;
        mv /root/go/bin/subfinder /usr/bin/
fi

echo -e "\n\n\033[33;1mASSETFINDER - TOMNOMNOM \033[m";

if [ -e /usr/bin/assetfinder ];then
        echo -e "\033[33;1mASSETFINDER JÁ INSTALADO";
else
        go install github.com/tomnomnom/assetfinder@latest;
        mv /root/go/bin/assetfinder /usr/bin/;
fi

echo -e "\n\n\033[33;1mHTTPX - PROJECTDISCOVERY\033[m";

if [ -e /usr/bin/httpx ];then
        echo -e "\033[32;1mHTTPX JÁ INSTALADO\033[m";
else
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest;
        mv /root/go/bin/httpx /usr/bin/;
fi

echo -e "\n\n\033[33;1mGET ALL URLS - CORBEN LEO\033[m";

if [ -e /usr/bin/gau ];then
        echo -e "\033[32;1m GAU JÁ INSTALADO\033[m";
else
        go install github.com/lc/gau/v2/cmd/gau@latest;
        mv /root/go/bin/gau /usr/bin/;
fi

echo -e "\n\n\033[33;1mHAKRAWLER - HAKLUKE\033[m";

if [ -e /usr/bin/hakrawler ];then
        echo -e "\033[32;1mHAKRAWLER JÁ INSTALADO\033[m";
else
        go install github.com/hakluke/hakrawler@latest;
        mv /root/go/bin/hakrawler /usr/bin/
fi

echo -e "\n\n\033[33;1mAUTOMAÇÃO - BURP SUITE - PORTSWIGGER\033[m";

mkdir "tool_burp_suite";
cd tool_burp_suite/;
if [ -e /usr/bin/burp ];then
        echo "burp" > executar.sh;
        chmod 777 executar.sh;
fi
if [ -e /usr/bin/burpsuite ];then
        echo "burpsuite" > executar.sh;
        chmod 777 executar.sh;
fi
cd ../;

echo -e "\n\n\033[33;1mTOOL - LOGMEPWN - 0xInfection\033[m";

mkdir "tool_LOG_4_SHELL";
cd tool_LOG_4_SHELL/;
wget "https://github.com/0xInfection/LogMePwn/archive/refs/tags/v2.0.zip";
unzip v2.0.zip;
cd LogMePwn-2.0/;
go build .;
mv lmp ../;
cd ../;
rm -rf LogMePwn-2.0/ v2.0.zip;
cd ../;

echo -e "\n\n\033[33;1mTOOL - POC-BOMBER - tr0uble-mAker\033[m";

git clone "https://github.com/tr0uble-mAker/POC-bomber";
mv POC-bomber/ tool_POC_BOMBER;
cd tool_POC_BOMBER/;
pip3 install -r requirements.txt;
cd ../;

echo -e "\n\n\033[33;1mTOOL - PWNXSS - pwn0sec\033[m";

git clone "https://github.com/pwn0sec/PwnXSS";
mv PwnXSS/ tool_PWNXSS;
cd tool_PWNXSS/;
pip3 install -r requirements.txt;
cd ../;

echo -e "\n\n\033[33;1mTOOL - SMUGGLER - defparam\033[m";

git clone "https://github.com/defparam/smuggler";
mv smuggler/ tool_SMUGGLER;

echo -e "\n\n\033[33;1mTOOL - TAKEOVER - M4LL0K\033[m";

git clone "https://github.com/m4ll0k/takeover.git";
mv takeover/ tool_TAKEOVER;
cd tool_TAKEOVER;
python3 setup.py install;
cd ../;

echo -e "\n\n\033[33;1mTOOL - LOGMEPWN - 0xInfection\033[m";

git clone "https://github.com/epinna/tplmap";
mv tplmap/ tool_TPLMAP;
cd tool_TPLMAP/;
pip3 install -r requirements.txt;
cd ../;

echo -e "\n\n\033[33;1mTOOL - VULMAP - ZHZYKER\033[m";

git clone "https://github.com/zhzyker/vulmap.git";
mv vulmap/ tool_VULMAP;
cd tool_VULMAP/;
pip3 install -r requirements.txt;
cd ../;
