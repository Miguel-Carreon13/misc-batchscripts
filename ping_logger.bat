@echo off
setlocal

:: Prompt user for IP address
set /p "IPAddress=Enter IP address to ping: "

:: Specify the log file location
set "LogFile=ping_log.txt"

:ping_loop
:: Get the current timestamp
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set "date=%%a-%%b-%%c"
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set "time=%%a:%%b"
set "timestamp=%date% %time%"

:: Display the timestamp and ping information
echo [%timestamp%] Pinging %IPAddress%

:: Ping the IP address and capture the result
for /f "tokens=*" %%a in ('ping -n 1 %IPAddress% ^| findstr /r /c:"TTL=" /c:"time="') do (
    set "PingResult=%%a"
)

:: Check if ping succeeded or failed
if "%PingResult%"=="" (
    set "PingResult=Request timed out"
)

:: Log the timestamp, IP address, and ping result to the log file
echo [%timestamp%] %IPAddress% - %PingResult% >> %LogFile%

:: Display result on screen
echo [%timestamp%] %PingResult%

:: Loop indefinitely until manually stopped
goto ping_loop
