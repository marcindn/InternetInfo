@echo off
color 7
echo. 
echo d888888b d8b   db d888888b d88888b d8888b. d8b   db d88888b d888888b d888888b d8b   db d88888b  .d88b. 
echo   `88'   888o  88 `~~88~~' 88'     88  `8D 888o  88 88'     `~~88~~'   `88'   888o  88 88'     .8P  Y8. 
echo    88    88V8o 88    88    88ooooo 88oobY' 88V8o 88 88ooooo    88       88    88V8o 88 88ooo   88    88 
echo    88    88 V8o88    88    88~~~~~ 88`8b   88 V8o88 88~~~~~    88       88    88 V8o88 88~~~   88    88
echo   .88.   88  V888    88    88.     88 `88. 88  V888 88.        88      .88.   88  V888 88      `8b  d8' 
echo Y888888P VP   V8P    YP    Y88888P 88   YD VP   V8P Y88888P    YP    Y888888P VP   V8P YP       `Y88P' 
echo.
echo Program made by: marcindn
timeout 1
echo.
ipconfig /all
echo.
netsh wlan show profile
echo.
systeminfo 
echo.
arp
echo.
arp -a
echo. 
route 
echo.
chcp
echo.
vol
echo.
netstat -e
echo.
getmac
echo.
route print
echo.
setlocal enabledelayedexpansion
for /f "tokens=2delims=:" %%a in ('netsh wlan show profile ^|findstr ":"') do (
    set "ssid=%%~a"
    call :getpwd "%%ssid:~1%%"
)
:getpwd
set "ssid=%*"
for /f "tokens=2delims=:" %%i in ('netsh wlan show profile name^="%ssid:"=%" key^=clear ^| findstr /C:"Key Content"') do echo ssid: %ssid% pass: %%i
echo.
ipconfig /flushdns
echo.
pause
goto 
