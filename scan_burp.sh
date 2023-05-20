#!/bin/bash

data=$(date +"%H:%M:%S");
echo -e "\033[1;34;40m"$data"\033[m \033[05;33m<BURP SUITE/>>\033[m\n";

cd tool_burp_suite/;
./executar.sh;
