import json, re, subprocess, os, pip, requests, tarfile, zipfile
from urllib.parse import urlparse

deps = "deps/ninjadeps.json"
osRls = "/etc/os-release"
baseTools="shuriken"

with open(deps, "r") as tools:
    depsTools = json.loads(tools.read())
    tools.close()

with open(osRls, "r") as release:
    file = release.read()
    file = file.split()
    release.close()

for key in file:
    if re.match(r"ID=(.*)", key):
        grep = re.match(r"ID=(.*)", key)

soID = grep[1]

if soID == "fedora":
    packages = depsTools["os"][soID]
    print("This may take a while, go get the coffe!\n")
    for pack in packages:
        if pack != depsTools["os"][soID][2] and \
            pack != depsTools["os"][soID][4] and  \
                pack != depsTools["os"][soID][6] and  \
                    pack != depsTools["os"][soID][7] and \
                        pack != depsTools["os"][soID][8]:
            cmdlet=f"dnf install -y {pack}"
            print(f"Need package: {pack}\n")
            with subprocess.Popen(cmdlet, stdout=subprocess.PIPE, shell=True) as cmd:
                print("Trying install package using dnf!\n")
                cmd.wait()
                cmdres = cmd.stdout.read()
            
            if cmdres:
                print(f"Package installed: {pack}\n")
    pipPacks = depsTools["pip"]
    for pips in pipPacks:
        pip.main(['install', pips])
    
    os.mkdir(baseTools)
    os.chdir(baseTools)
    
    gitPacks = depsTools["tools"]["git"]

    for git in gitPacks:
        cmdlet=f"git clone {git}"
        with subprocess.Popen(cmdlet, stdout=subprocess.PIPE, shell=True) as gclone:
            gclone.wait()
            cmdres = gclone.stdout.read()

    gitZips = depsTools["tools"]["gitzip"]

    for git in gitZips:
        print(f"Downloading: {git}")
        giturl = urlparse(git).path.split("/")
        gitpack = giturl[-1]
        download = requests.get(git, timeout=180, allow_redirects=True)
        with open(gitpack, "wb") as file:
            if file.write(download.content):
                print(f"Compact pack save in: {gitpack}")
                ext = gitpack.split(".")[-1]
                if ext == "gz" or ext == "bz" or ext == "lzma":
                    compact = tarfile.open(gitpack, "r")
                    compact.extractall()
                    os.remove(gitpack)
                if ext == "zip":
                    compact = zipfile.ZipFile(gitpack)
                    compact.extractall()
                    os.remove(gitpack)
