@echo off

::Variables
set DSN_NAME=optera-usl0904
set DRIVER_NAME=IBM INFORMIX ODBC DRIVER (64-bit)
set DB_SERVER=optifacts_0904n
set HOSTNAME=172.21.4.5
set SERVICE=9089
set PROTOCOL=sesoctcp
set DB_NAME=optifacts
set USERNAME=app_optifacts_0904
set PASSWORD=EssiLux2024$

::Add ODBC System DSN to Windows Registry
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "Driver" /t REG_SZ /d "C:\Program Files\IBM Informix Client-SDK\bin\iclit09b.dll" /f
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "Database" /t REG_SZ /d "%DB_NAME%" /f
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "Server" /t REG_SZ /d "%DB_SERVER%" /f
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "Hostname" /t REG_SZ /d "%HOSTNAME%" /f
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "Service" /t REG_SZ /d "%SERVICE%" /f
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "Protocol" /t REG_SZ /d "%PROTOCOL%" /f
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "User" /t REG_SZ /d "%USERNAME%" /f
reg add "HKLM\SOFTWARE\ODBC\ODBC.INI\%DSN_NAME%" /v "Password" /t REG_SZ /d "%PASSWORD%" /f

REM Add DSN to ODBC Data Sources
reg add "HKLM\SOFTWARE\ODBC\ODBCINST.INI\ODBC Data Sources" /v "%DSN_NAME%" /t REG_SZ /d "%DRIVER_NAME%" /f

echo DSN %DSN_NAME% created successfully!