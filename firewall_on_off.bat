@echo off
:index
cls
title Firewall
color 0f
echo.
echo [Firewall]
echo __________
echo.
echo 1. Activar Firewall
echo.
echo 2. Desactivar Firewall
echo.
echo 0. Salir
echo.
echo.
set /p choice=$ Presione el número con la opción que desea seleccionar:
if not defined choice (
	goto error
)

if %choice%==1 goto turnon
if %choice%==2 goto turnoff
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


:turnon
title Activar
color 0a
echo.
netsh advfirewall set allprofiles state on
echo.
pause
goto index

:turnoff
title Desactivar
color 0a
echo.
netsh advfirewall set allprofiles state off
echo.
pause
goto index
