@echo off

:index
cls
title Map Network Drives ECO labs
color 0f
echo.
echo [Map Network Drives ECO labs]
echo _____________________________
echo.
echo 1. Map ECO1
echo.
echo 2. Map ECO2
echo.
echo 3. Map Public
echo.
echo 4. Map Vic File Server
echo.
echo 0. Exit
echo.
echo.

set /p choice=$ Choose an option:

if not defined choice (
	goto error
)

if %choice%==1 goto eco1Map
if %choice%==2 goto eco2Map
if %choice%==3 goto publicMap
if %choice%==4 goto vicMap
if %choice%==0 goto:eof
if errorlevel==1 goto error

:error
color 4
title Error
echo.
echo.
echo Command not recognized
timeout /t 2 /nobreak>nul
goto index

:eco1Map
net use x: \\mx-fileseco\eco1 /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:eco2Map
net use y: \\mx-fileseco\eco2 /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:publicMap
net use z: \\mx-fileseco\public /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:vicMap
net use v: \\172.22.187.9\itdata
color 0a
timeout /t 1 /nobreak>nul
goto index
