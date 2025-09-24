@echo off
setlocal

:: Configuration
set "driveLetter=Y:"
set "hostnameShare=\\SFEVO24002504\Racer Fram Database"
set "ipShare=\\172.21.66.113\Racer Fram Database"
set "username=MEI User"
set "password=yourPassword"

:: Try mapping using hostname
echo Attempting to map %driveLetter% to %hostnameShare%
net use %driveLetter% %hostnameShare% /user:%username% %password% >nul 2>&1

if %ERRORLEVEL% neq 0 (
    echo Failed to connect using hostname. Trying IP address...
    net use %driveLetter% %ipShare% /user:%username% %password% >nul 2>&1

    if %ERRORLEVEL% neq 0 (
        echo Failed to connect using IP address as well.
    ) else (
        echo Successfully connected using IP address.
    )
) else (
    echo Successfully connected using hostname.
)

endlocal
