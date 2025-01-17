@echo off
setlocal enabledelayedexpansion

:: Ask for the target address
set /p TARGET=Enter the target address: 
if "%TARGET%"=="" (
    echo No target entered. Exiting.
    exit /b
)

:: Ask if a log file should be generated
set /p LOGCHOICE=Do you want to generate a log file? (y/n): 
if /i "%LOGCHOICE%"=="y" (
    :: Generate a timestamped log file name
    for /f "tokens=1-4 delims=/-: " %%A in ("%date% %time%") do (
        set TIMESTAMP=%%A-%%B-%%C_%%D
    )
    set LOGFILE=tracert_log_%TIMESTAMP%.txt
    echo Log file will be created: %LOGFILE%
) else if /i "%LOGCHOICE%"=="n" (
    set LOGFILE=
    echo No log file will be created.
) else (
    echo Invalid choice. Exiting.
    exit /b
)

echo Starting continuous tracert to %TARGET%
echo Press Ctrl+C to stop.

:loop
    echo Tracing route to %TARGET% at %date% %time%
    if defined LOGFILE (
        echo Tracing route to %TARGET% at %date% %time% >> %LOGFILE%
        tracert %TARGET% >> temp_output.txt
        type temp_output.txt
        type temp_output.txt >> %LOGFILE%
        del temp_output.txt
    ) else (
        tracert %TARGET%
    )
goto loop
