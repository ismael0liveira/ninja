import random
import os

numero=random.randint(1,7)
numeroBanner=random.randint(1,9)

banner="ninja"+str(numero)+".txt"

os.system("cat "+banner)
