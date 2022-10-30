from sys import exit
from time import sleep
from os import getenv, linesep, system
from os.path import exists
from urllib.request import urlopen, urlretrieve
from json import loads

a = urlopen("https://clientsettingscdn.roblox.com/v2/client-version/WindowsPlayer/channel/zflag").read()
a = loads(a)["clientVersionUpload"]
print("Client version hash: "+a)
filepath = getenv("LOCALAPPDATA")+"\Roblox\Versions\\"

debug = False
if exists(filepath) and not debug:
    print("Found \"\Roblox\Versions\\\" folder!")
    filepath+=a
    if exists(filepath):
        print("Found \""+a+"\" folder!")
    else:
        print("[Error]: Unable to locate latest roblox client!")
        exit(1)
else:
    print("[Error]: Could not find the \"\Roblox\Versions\\\" folder!")
    littleTimmyPrevention()
    exit(1)
exit(0)
