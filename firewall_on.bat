@echo off
cls
title Firewall
echo.
echo [Encender Firewall]
echo _________________
echo.

title Turning off
echo.
netsh advfirewall set allprofiles state on
echo.
pause
