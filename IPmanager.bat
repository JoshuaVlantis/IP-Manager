@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    

mode con: cols=100 lines=30
Title = IP Config
echo Select which setup you want to take
echo _______________________________________
echo _______________________________________
echo 1- Set Static IP
echo 2- Set DHCP
echo 3- Pre made IPS
echo 4- Open Network Connections
echo _______________________________________
:choice
SET /P C=Select Number:
for %%? in (1) do if /I "%C%"=="%%?" goto A
for %%? in (2) do if /I "%C%"=="%%?" goto B
for %%? in (3) do if /I "%C%"=="%%?" goto Premade
for %%? in (4) do if /I "%C%"=="%%?" goto network
goto choice



:Premade
cls
::EDIT HERE TO ADD PRE MADE CONFIGS
echo Select a pre made config
echo _______________________________________
echo _______________________________________
echo 1- IP : 192.168.10.200 Mask : 255.255.255.0 Gate : 0.0.0.0
echo 2-Edit 
echo 3-File	
echo 4-To 		
echo 5-Add 	
echo 6-Pre 
echo 7-Mades
echo _______________________________________



:f
SET /P C=Select Number:
for %%? in (1) do if /I "%C%"=="%%?" goto pre1
for %%? in (2) do if /I "%C%"=="%%?" goto pre2
for %%? in (3) do if /I "%C%"=="%%?" goto pre3
for %%? in (4) do if /I "%C%"=="%%?" goto pre4
for %%? in (5) do if /I "%C%"=="%%?" goto pre5
for %%? in (6) do if /I "%C%"=="%%?" goto pre6
for %%? in (7) do if /I "%C%"=="%%?" goto pre7
goto f

:pre1
cls
Color 0A
echo "Setting Static IP Information"
::																	IP			Mask		Gate				
netsh interface ip set address "Local Area Connection" static 192.168.10.200 255.255.255.0 122.232.233.123
netsh int ip show config
pause
goto end

:pre2
cls
Color 0A
echo "Setting Static IP Information"
:: 																IP		Mask	Gate				
netsh interface ip set address "Local Area Connection" static 0.0.0.0 0.0.0.0 0.0.0.0
netsh int ip show config
pause
goto end

:pre3
cls
Color 0A
echo "Setting Static IP Information"
:: 																IP		Mask	Gate				
netsh interface ip set address "Local Area Connection" static 0.0.0.0 0.0.0.0 0.0.0.0
netsh int ip show config
pause
goto end

:pre4
cls
Color 0A
echo "Setting Static IP Information"
:: 																IP		Mask	Gate				
netsh interface ip set address "Local Area Connection" static 0.0.0.0 0.0.0.0 0.0.0.0
netsh int ip show config
pause
goto end

:pre5
cls
Color 0A
echo "Setting Static IP Information"
:: 																IP		Mask	Gate				
netsh interface ip set address "Local Area Connection" static 0.0.0.0 0.0.0.0 0.0.0.0
netsh int ip show config
pause
goto end

:pre6
cls
Color 0A
echo "Setting Static IP Information"
:: 																IP		Mask	Gate				
netsh interface ip set address "Local Area Connection" static 0.0.0.0 0.0.0.0 0.0.0.0
netsh int ip show config
pause
goto end

:pre7
cls
Color 0A
echo "Setting Static IP Information"
:: 																IP		Mask	Gate				
netsh interface ip set address "Local Area Connection" static 0.0.0.0 0.0.0.0 0.0.0.0
netsh int ip show config
pause
goto end

:network
ncpa.cpl
goto end


:A
cls
@echo off

echo ___________________________________________________________
echo "  _____   _____                     _       _ 		"                          
echo " |_   _| |  __ \        /\         | |     | | 	"                         
echo "   | |   | |__) |      /  \      __| |   __| |  _ __    ___   ___   ___ 	"
echo "   | |   |  ___/      / /\ \    / _` |  / _` | | '__|  / _ \ / __| / __|	"
echo "  _| |_  | |         / ____ \  | (_| | | (_| | | |    |  __/ \__ \ \__ \	"
echo " |_____| |_|        /_/    \_\  \__,_|  \__,_| |_|     \___| |___/ |___/	"
echo ___________________________________________________________
echo "Please enter Static IP Address Information"
echo "Static IP Address:"
echo _______________________________________
echo _______________________________________

set /p IP_Addr=

cls
echo ________________________________________________________________
echo "   _____           _                      _       __  __                 _  "  
echo "  / ____|         | |                    | |     |  \/  |               | | " 
echo " | (___    _   _  | |__    _ __     ___  | |_    | \  / |   __ _   ___  | | __"
echo "  \___ \  | | | | | '_ \  | '_ \   / _ \ | __|   | |\/| |  / _` | / __| | |/ /"
echo "  ____) | | |_| | | |_) | | | | | |  __/ | |_    | |  | | | (_| | \__ \ |   < "
echo " |_____/   \__,_| |_.__/  |_| |_|  \___|  \__|   |_|  |_|  \__,_| |___/ |_|\_\"
echo ________________________________________________________________

echo Do you want to set a custom Subnet Mask?
echo ______________________________________
echo 1- Yes
echo 2- No  (255.255.255.0)
echo _______________________________________

:choice3

SET /P C=Select Number:
for %%? in (1) do if /I "%C%"=="%%?" goto A2
for %%? in (2) do if /I "%C%"=="%%?" goto de_mask
goto choice3

:A2
cls

echo Please enter a Subnet Mask
echo Subnet Mask:

set /p Sub_Mask=
goto gate





:de_mask

cls

echo ____________________________________________
echo "  _____           _ 				"                                    
echo " / ____|         | |				"                                   
echo "| |  __    __ _  | |_    ___  __      __   __ _   _   _ "
echo "| | |_ |  / _` | | __|  / _ \ \ \ /\ / /  / _` | | | | |"
echo "| |__| | | (_| | | |_  |  __/  \ V  V /  | (_| | | |_| |"
echo " \_____|  \__,_|  \__|  \___|   \_/\_/    \__,_|  \__, |"
echo "                                                   __/ |"
echo"                                                   |___/ "
echo ____________________________________________

echo Do you want to set a custom gate?
echo _______________________________________
echo [1] Yes
echo [2] No		(0.0.0.0)
echo _______________________________________

:z

SET /P C=Select Number:
for %%? in (1) do if /I "%C%"=="%%?" goto A3
for %%? in (2) do if /I "%C%"=="%%?" goto de_all
goto z

:A3
cls
echo Please enter a Gateway
echo Gateway:

set /p D_Gate=

goto mask


:gate
cls
echo ____________________________________________
echo "  _____           _ 				"                                    
echo " / ____|         | |				"                                   
echo "| |  __    __ _  | |_    ___  __      __   __ _   _   _ "
echo "| | |_ |  / _` | | __|  / _ \ \ \ /\ / /  / _` | | | | |"
echo "| |__| | | (_| | | |_  |  __/  \ V  V /  | (_| | | |_| |"
echo " \_____|  \__,_|  \__|  \___|   \_/\_/    \__,_|  \__, |"
echo "                                                   __/ |"
echo"                                                   |___/ "
echo ____________________________________________

echo Do you want to set a custom gate?
echo _______________________________________
echo [1] Yes
echo [2] No		(0.0.0.0)
echo _______________________________________
:x


SET /P C=Select Number:
for %%? in (1) do if /I "%C%"=="%%?" goto A4
for %%? in (2) do if /I "%C%"=="%%?" goto de_gate
goto x

:A4
cls
echo "Please enter Gateway"
echo "Subnet Mask:"

set /p D_Gate=

goto Allcustom



:Allcustom
cls
Color 0A
echo "Setting Static IP Information"
netsh interface ip set address "Local Area Connection" static %IP_Addr% %Sub_Mask% %D_Gate%
netsh int ip show config
pause
goto end

:mask
cls
Color 0A
echo "Setting Static IP Information"
netsh interface ip set address "Local Area Connection" static %IP_Addr% 255.255.255.0 %D_Gate%
netsh int ip show config
pause
goto end

:de_gate
cls
Color 0A
echo "Setting Static IP Information"
netsh interface ip set address "Local Area Connection" static %IP_Addr% %Sub_Mask% 0.0.0.0
netsh int ip show config
pause
goto end

:de_all
cls
Color 0A
echo "Setting Static IP Information"
netsh interface ip set address "Local Area Connection" static %IP_Addr% 255.255.255.0 0.0.0.0
netsh int ip show config
pause
goto end






:B
cls
Color 0A
@ECHO OFF
ECHO Resetting IP Address and Subnet Mask For DHCP
netsh int ip set address name = "Local Area Connection" source = dhcp

ipconfig /renew

ECHO Here are the new settings for %computername%:
netsh int ip show config

pause
goto end
:end

Script END!