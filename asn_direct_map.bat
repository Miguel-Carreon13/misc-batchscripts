@echo off

:index
cls
title Map Network Drives ECO labs
color 0f
echo.
echo [Map Network Drives ECO labs]
echo _____________________________
echo.
echo 1. Map Luxotica
echo.
echo 2. Map Alternative
echo.
echo 0. Exit
echo.
echo.

set /p choice=$ Choose an option:

if not defined choice (
	goto error
)

if %choice%==1 goto LuxMap
if %choice%==2 goto AltMap
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

:LuxMap
net use L: \\172.21.66.195\d$\Luxotica /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:AltMap
net use K: \\mx-fileseco\ECO1\Lux /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index