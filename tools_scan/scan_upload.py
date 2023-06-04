import requests
from bs4 import BeautifulSoup
import sys
import urllib3
import pyfiglet

banner = pyfiglet.figlet_format("UPLOADS!!")
print(banner)

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

url = sys.argv[1]

requisicao = requests.get(url.replace("\n",""), verify = False)
html = BeautifulSoup(requisicao.content, 'html.parser')

print("\033[34;1mInputs UPLOAD de: \033[m"+str(url)+"\n")
inputs = html.find_all("input", attrs={"type": "file"})
print(inputs)
