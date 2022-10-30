@ECHO OFF
title Internet Fix
echo Fixing internet...
ipconfig /flushdns
echo Waiting 2 seconds (READYING UP)...
TIMEOUT 2
ipconfig /renew
echo Waiting 2 seconds (LOADING)...
TIMEOUT 2
netsh winsock reset
echo Successfuly fixed internet!