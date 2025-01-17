@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges. Please run as administrator.
    pause
    exit /b
)

:: Set the registry key path and value name
set "RegPath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
set "ValueName=SMB1"

:: Set the new value (1 to enable, 0 to disable)
set "NewValue=1"

:: Change the registry key silently
reg add "%RegPath%" /v "%ValueName%" /t REG_DWORD /d %NewValue% /f >nul 2>&1

:: Check if the operation was successful
if %errorlevel% neq 0 (
    echo Failed to update the %ValueName% value. Please check the path and permissions.
    pause
)