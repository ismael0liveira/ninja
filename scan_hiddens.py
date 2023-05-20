import requests
from bs4 import BeautifulSoup
import urllib3
import sys
import os
import pyfiglet

banner = pyfiglet.figlet_format("HIDDENS!!")
print(banner)

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

os.system('bash s_mesclar_Hiddens_params_copia_arquivo.sh')

arquivo = open('subsResolvidos.txt')
for dominio in arquivo.readlines():
	requisicao = requests.get(dominio.replace('\n',''), verify=False)
	html=BeautifulSoup(requisicao.content, 'html.parser')
	inputs=html.findAll('input', attrs={'type':'hidden'})

	with open('hiddens_nao_mesclados.txt', 'a') as arquivo:
		for hd in inputs:
			url=dominio.replace('\n','')+"/?"+hd['name']+"="+"\n"
			arquivo.write(url)


os.system('bash s_mesclar_Hiddens_params.sh')
