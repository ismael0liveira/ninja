import os, re, random
motdBanners = "motd/"

def insertMotd(motd):
    motds = []
    if re.match(r"ninja[0-9].txt", motd):
        motds.append(motd)
    if motds != None:
        return motds

if os.access(motdBanners, os.R_OK):
    allFiles = os.listdir(motdBanners)
    absPath = os.getcwd()
    motds = list(map(insertMotd, allFiles))
    rnd = random.randint(1,len(motds)-1)
    file = str(absPath+f"/{motdBanners}"+motds[rnd][0])

    with open(file) as banner:
        print(banner.read())
