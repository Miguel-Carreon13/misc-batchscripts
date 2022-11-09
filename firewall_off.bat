@echo off
cls
title Firewall
echo.
echo [Apagar Firewall]
echo _________________
echo.

title Turning off
echo.
netsh advfirewall set allprofiles state off
echo.
pause
