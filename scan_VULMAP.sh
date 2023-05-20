#!/bin/bash

pasta=$(pwd);

python3 tool_VULMAP/vulmap.py -f $pasta"/scanner/"$1"/resultados/subs.txt" -t 50 --debug --output-text $pasta"/scanner/"$1"/resultados/resultados_VULMAP.txt"
