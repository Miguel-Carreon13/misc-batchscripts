@echo off
setlocal enabledelayedexpansion

:: Define 7-Zip executable path (properly quoted)
set "ZIP_EXEC=C:\Program Files\7-Zip\7z.exe"

:: Check if 7z is available
if not exist "%ZIP_EXEC%" (
    echo 7-Zip not found at "%ZIP_EXEC%". Please check the path.
    exit /b 1
)

:: Process each .Z file in parallel
for /r %%F in (*.Z) do (
    set "DIR=%%~dpF"
    set "BASENAME=%%~nF"  :: Get filename without extension
    echo Extracting "%%F" in "!DIR!"...

    :: Corrected start command to handle spaces in paths
    start /b "" cmd /c ""%ZIP_EXEC%" e "%%F" -o"!DIR!" -y >nul && ren "!DIR!%%~nF" "%%~nF.out" && del "%%F""
)

echo All extractions started. Please wait...
exit /b
