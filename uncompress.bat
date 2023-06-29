@echo off

setlocal

REM Check if 7-Zip is installed
set "SEVENZIP_PATH=C:\Program Files\7-Zip\7z.exe"
if not exist "%SEVENZIP_PATH%" (
    echo 7-Zip is not installed on this system.
    goto end
)

REM Extract and delete .Z archives
setlocal enabledelayedexpansion
set start_time=!time: =0!

for %%F in (*.Z) do (
    echo Extracting "%%F"
    "%SEVENZIP_PATH%" e "%%F" -bso0 -bsp1 -mmt
    echo Deleting "%%F"
    del "%%F"
)

set end_time=!time: =0!
set /a "elapsed_time=((1!end_time:~0,2!-1!start_time:~0,2!)*3600)+((1!end_time:~3,2!-1!start_time:~3,2!)*60)+((1!end_time:~6,2!-1!start_time:~6,2!))+((1!end_time:~9,2!-1!start_time:~9,2!)/10)"

echo Execution time: %elapsed_time% seconds

:end
pause
