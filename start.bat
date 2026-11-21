@echo off
title Handwriting Studio Pro Deluxe Server
cd /d "%~dp0"
echo ==============================================================
echo       Starting Handwriting Studio Pro Deluxe Web App...
echo ==============================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
