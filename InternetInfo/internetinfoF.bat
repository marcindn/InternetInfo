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
echo Internet Info >>D:\plik.txt
echo Program made by: marcindn
timeout 1
echo.
ipconfig /all
ipconfig /all >>D:\plik.txt
echo.
netsh wlan show profile
netsh wlan show profile >>D:\plik.txt
echo.
systeminfo 
systeminfo >>D:\plik.txt
echo.
arp
arp >>D:\plik.txt
echo.
arp -a
arp -a >>D:\plik.txt
echo. 
route 
route >>D:\plik.txt
echo.
chcp
chcp >>D:\plik.txt
echo.
vol
vol >>D:\plik.txt
echo.
netstat -e
netstat -e >>D:\plik.txt
echo.
getmac
getmac >>D:\plik.txt
echo.
route print
route print >>D:\plik.txt
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
setlocal enabledelayedexpansion
for /f "tokens=2delims=:" %%a in ('netsh wlan show profile ^|findstr ":"') do (
    set "ssid=%%~a"
    call :getpwd "%%ssid:~1%%"
)
:getpwd
set "ssid=%*"
for /f "tokens=2delims=:" %%i in ('netsh wlan show profile name^="%ssid:"=%" key^=clear ^| findstr /C:"Key Content"') do echo ssid: %ssid% pass: %%i >>D:\plik.txt
echo.
ipconfig /flushdns
echo.
pause
goto 