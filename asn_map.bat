@echo off
title Map ASN folders

echo [Map Network Drives ECO labs]
echo _____________________________
echo.
echo.

set "source1=\\172.21.66.195\d$\Luxotica"
set "source2=\\mx-fileseco\ECO1\Lux"
set "driveletter1=L:"
set "driveletter2=K:"

echo Mapping %source1% to %driveletter1%
net use %driveletter1% %source1% /persistent:yes

if errorlevel==1 goto error

echo Mapping %source2% to %driveletter2%
net use %driveletter2% %source2% /persistent:yes

if errorlevel==1 goto error

color 0a
echo Mapping completed successfully
pause


:error
color 4
title Error
echo.
echo.
echo Problem mapping the folder
timeout /t 10 /nobreak>nul