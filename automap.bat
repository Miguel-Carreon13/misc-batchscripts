@echo off

net use t: /delete /yes
timeout /t 3 /nobreak>nul
net use t: \\10.153.68.53\eco1

net use u: /delete /yes
timeout /t 3 /nobreak>nul
net use u: \\10.153.68.53\eco2

net use v: /delete /yes
timeout /t 3 /nobreak>nul
net use v: \\172.22.187.2\ITDATA /persistent:yes