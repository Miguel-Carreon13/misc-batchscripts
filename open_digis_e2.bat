@echo off
REM Check if Firefox is installed
set "firefox_path=C:\Program Files\Mozilla Firefox\firefox.exe"
if not exist "%firefox_path%" (
    set "firefox_path=C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
)

if not exist "%firefox_path%" (
    echo Firefox not found. Please ensure it is installed and the path is correct.
    exit /b
)

set "url1=http://172.21.65.23/"
set "url2=http://172.21.65.24/"
set "url3=http://172.22.185.24/"
set "url4=http://172.22.185.25/"

start "" "%firefox_path%" -new-tab "%url1%" -new-tab "%url2%" -new-tab "%url3%" -new-tab "%url4%"

exit