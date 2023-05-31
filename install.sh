#!/bin/bash

cat banner_install.txt;
echo -e "\n\033[32;1mBy: Ismael Oliveira\033[m";

user=$(whoami);
if [ $user != "root" ];then
        echo -e "\033[31;1mPor favor, entre como root para prosseguir...\033[m";
        exit;
fi

chmod 777 scanner/;
chmod +x *.sh;

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
                        apt install python3-pip -y;
                        pip3 install pyfiglet;;
                "2")
                        pacman -Sy python3;
                        pacman -Sy python3-pip;
                        pip3 install pyfiglet;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac

fi




if [ -e /usr/share/zaproxy/zap.sh ];then
        echo -e "\033[32;1mZAPROXY JÁ INSTALADO...\033[m";
else
        echo -e "\n\n\033[32;1m Instalando ZAPROXY - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

       read -p "Selecione: [1/2]" resposta;
         case $resposta in
                "1")
                        apt install zaproxy;;
                "2")
                        pacman -Sy zaproxy;;
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


echo -e "\n\n\033[33;1mDAVTEST - CLDRN\033[m";

if [ -e /usr/bin/curl ];then
        echo -e "\033[32;1mCURL JÁ INSTALADO...\033[m";
else
        echo -e "\n\n\033[32;1m Instalando DAVTEST - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install davtest -y;;
                "2")
                        pacman -Sy davtest -y;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac

fi



echo -e "\n\n\033[33;1mSQLMAP - SQLInjection\033[m";

if [ -e /usr/bin/sqlmap ];then
        echo -e "\033[32;1mSQLMAP JÁ INSTALADO...\033[m";
else
        echo -e "\n\n\033[32;1m Instalando SQLMAP - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

        read -p "Selecione: [1/2]" resposta;
        case $resposta in
                "1")
                        apt install sqlmap -y;;
                "2")
                        pacman -Sy sqlmap -y;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac

fi



echo -e "\n\n\033[33;1mNGROK \033[m";

if [ -e /usr/bin/ngrok ];then
        echo -e "\033[32;1mNGROK JÁ INSTALADO...\033[m";
else
    wget "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz";
    tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin;
fi

echo -e "\n\n\033[33;1mGOWITNESS \033[m";

if [ -e /usr/bin/gowitness ];then
        echo -e "\033[32;1mGOWITNESS JÁ INSTALADO...\033[m";
else
		go install github.com/sensepost/gowitness@latest;
		mv /root/go/bin/gowitness /usr/bin/
fi

echo -e "\n\n\033[33;1mFINDOMAIN \033[m";

if [ -e /usr/bin/findomain ];then
        echo -e "\033[32;1mFINDOMAIN JÁ INSTALADO\033[m";
else
        curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip;
        unzip findomain-linux-i386.zip;
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


echo -e "\n\n\033[33;1mHTTPROBE - TOMNOMNOM\033[m";

if [ -e /usr/bin/httprobe ];then
        echo -e "\033[32;1mHTTPROBE JÁ INSTALADO\033[m";
else
        go install github.com/tomnomnom/httprobe@latest;
        mv /root/go/bin/httprobe /usr/bin/;
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

echo -e "\n\n\033[33;1mCorsMe - Shivangx01b\033[m";

if [ -e /usr/bin/CorsMe ];then
        echo -e "\033[32;1mCorsMe JÁ INSTALADO\033[m";
else
        go install github.com/shivangx01b/CorsMe@latest;
        mv /root/go/bin/CorsMe /usr/bin/
fi

echo -e "\n\n\033[33;1mCRLFUZZ - dwisiswant0\033[m";

if [ -e /usr/bin/crlfuzz ];then
        echo -e "\033[32;1mCRLFUZZ JÁ INSTALADO\033[m";
else
        GO111MODULE=on go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest;
        mv /root/go/bin/crlfuzz /usr/bin/
fi




echo -e "\n\n\033[33;1mAUTOMAÇÃO - BURP SUITE - PORTSWIGGER\033[m";

mkdir "tool_burp_suite";
cd tool_burp_suite/;

if [ -e /usr/bin/burpsuite ];then
        echo -e "\033[32;1mBURPSUITE JÁ INSTALADO...\033[m"
else
        echo -e "\n\n\033[32;1m Instalando BURPSUITE - Selecione 1 para [Kali Linux/Parrot/Debian] Selecione 2 para [Arch Linux]\033[m";

       read -p "Selecione: [1/2]" resposta;
         case $resposta in
                "1")
                        apt install burpsuite;;
                "2")
                        pacman -Sy burpsuite;;
                *)
                        echo -e "\033[31;1mOpção Inválida!!\033[m";
                        exit;;
                esac

fi

if [ -e /usr/bin/burpsuite ];then
        echo "burpsuite" > executar.sh;
        chmod 777 executar.sh;
fi
cd ../;

echo -e "\n\n\033[33;1mARACHNI SCAN\033[m";
wget "https://github.com/Arachni/arachni/releases/download/v1.6.1.3/arachni-1.6.1.3-0.6.1.1-linux-x86_64.tar.gz";
tar -xvf arachni-1.6.1.3-0.6.1.1-linux-x86_64.tar.gz;
rm arachni-1.6.1.3-0.6.1.1-linux-x86_64.tar.gz;

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


echo -e "\n\n\033[33;1mTOOL - WAD - CERN-CERT\033[m";

git clone "https://github.com/CERN-CERT/WAD";
cd WAD/;
pip3 install wad;
python3 setup.py install;
cd ../;
mv WAD tool_WAD;

echo -e "\n\n\033[33;1mTOOL - CORSY - s0md3v\033[m";

git clone "https://github.com/s0md3v/Corsy";
mv Corsy tool_CORSY;
cd tool_CORSY;
pip3 install -r requirements.txt;
cd ../;

echo -e "\n\n\033[33;1mTOOL - CRLFsuite - Nefcore\033[m";

git clone "https://github.com/Nefcore/CRLFsuite";
mv CRLFsuite tool_CRLF_SUITE;
cd tool_CRLF_SUITE/;
pip3 install crlfsuite;
python3 setup.py install;
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

echo -e "\n\n\033[33;1mTOOL - ORALYZER - r0075h3ll\033[m";

git clone "https://github.com/r0075h3ll/Oralyzer.git";
mv Oralyzer tool_ORALYZER/;
cd tool_ORALYZER/;
pip3 install -r requirements.txt;
cd ../;
