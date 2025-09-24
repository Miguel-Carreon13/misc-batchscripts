@echo off

:index
cls
title Map Network Drives ECO labs
color 0f
echo.
echo [Map Network Drives ECO labs]
echo _____________________________
echo.
echo 1. Map Fileseco ECO1
echo.
echo 2. Map Fileseco ECO2
echo.
echo 3. Map Fileseco Public
echo.
echo 4. Map Azure ECO1 Sofi
echo.
echo 5. Map Azure ECO2 Sofi
echo.
echo 6. Map itdata
echo.
echo 7. Map Azure ECOs
echo.
echo 8. Map Azure Public
echo.
echo 0. Exit
echo.
echo.

set /p choice=$ Choose an option:

if not defined choice (
	goto error
)

if %choice%==1 goto eco1fileseco
if %choice%==2 goto eco2fileseco
if %choice%==3 goto publicfileseco
if %choice%==4 goto eco1azure
if %choice%==5 goto eco2azure
if %choice%==6 goto itdata
if %choice%==7 goto ecosazure
if %choice%==8 goto ecosazurepub
if %choice%==0 goto:eof
if errorlevel==1 goto error

:error
color 4
title Error
echo.
echo.
echo Command not recognized
timeout /t 4 /nobreak>nul
goto index

:eco1fileseco
net use x: /delete /yes
timeout /t 3 /nobreak>nul
net use x: \\mx-fileseco\eco1 /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:eco2fileseco
net use y: /delete /yes
timeout /t 3 /nobreak>nul
net use y: \\mx-fileseco\eco2 /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:publicfileseco
net use z: /delete /yes
timeout /t 3 /nobreak>nul
net use z: \\mx-fileseco\public /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:eco1azure
net use t: /delete /yes
timeout /t 3 /nobreak>nul
net use t: \\10.153.68.53\eco1
color 0a
timeout /t 1 /nobreak>nul
goto index

:eco2azure
net use u: /delete /yes
timeout /t 3 /nobreak>nul
net use u: \\10.153.68.53\eco2
color 0a
timeout /t 1 /nobreak>nul
goto index

:itdata
net use v: /delete /yes
timeout /t 3 /nobreak>nul
net use v: \\172.22.187.2\ITDATA /persistent:yes
color 0a
timeout /t 1 /nobreak>nul
goto index

:ecosazure
net use s: /delete /yes
timeout /t 3 /nobreak>nul
net use s: \\ELCEOAECOFSP01\ECOs
color 0a
timeout /t 1 /nobreak>nul
goto index

:ecosazurepub
net use r: /delete /yes
timeout /t 3 /nobreak>nul
net use s: \\ELCEOAECOFSP01\public
color 0a
timeout /t 1 /nobreak>nul
goto index