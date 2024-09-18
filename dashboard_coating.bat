@echo off
set nircmd_path=C:\NirCmd\nircmd.exe
set nircmd_url=https://www.nirsoft.net/utils/nircmd.zip
set download_dir=C:\NirCmd
set zip_file=%download_dir%\nircmd.zip

REM Check if NirCmd is installed
if exist "%nircmd_path%" (
    echo NirCmd is already installed.
) else (
    echo NirCmd not found. Installing NirCmd...
    
    REM Create download directory if it doesn't exist
    if not exist "%download_dir%" mkdir "%download_dir%"
    
    REM Download NirCmd using PowerShell
    powershell -Command "Invoke-WebRequest -Uri %nircmd_url% -OutFile %zip_file%"
    
    REM Unzip NirCmd
    powershell -Command "Expand-Archive -Path %zip_file% -DestinationPath %download_dir%"
    
    REM Clean up the zip file
    del %zip_file%
    
    echo NirCmd installed successfully.
)

REM Launch the webpage and move it to the desired monitor
start chrome --start-fullscreen "http://172.21.65.145:82/Dhr/CheckLogins?Lab=Eco1&Area=CoatingOut"
timeout /t 5 /nobreak
%nircmd_path% win move title "- PrometeoV2.0 ECO2" 1920 0 1920 1080
exit