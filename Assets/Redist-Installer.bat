@echo off



::     ██╗    ██╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗                           
::     ██║    ██║██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝                           
::     ██║ █╗ ██║███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗                          
::     ██║███╗██║██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║                          
::     ╚███╔███╔╝██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝                          
::      ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝   
::      
::      
::      MAKE SURE YOU SAVE THIS FILE AS A .BAT.
::      HIT CTRL+S ON THIS PAGE AND CHANGE "FILE TYPE" TO ALL FILES.
::      THEN REMOVE THE .TXT AT THE END OF THE FILE NAME.
::      
::      IF YOU CAN'T FIGURE THAT OUT, VISIT THIS PAGE WHICH ACTUALLY DOWNLOADS THE FILE.
::      https://cmh.pw/Pluto-Redists
::      https://cmh.pw/Pluto-Redists
::      https://cmh.pw/Pluto-Redists
::      https://cmh.pw/Pluto-Redists



:: 4/24/2021 7:38 PM 
:: VC 2010 -> 2019, DirectX 9.0, DirectX Addon Pack, .NET 4.7.2, %localappdata%\Plutonium, & Plutonium-staging whitelist

:: Made by Chase (https://chse.xyz)
:: YOU DO NOT HAVE PERMISSION TO COPY/ALTER THIS CODE IN ANY WAY.

:: IF THIS SCRIPT EVER BREAKS, PLEASE DM ME ON DISCORD: https://discord.gg/Xh7cM5j6vw
:: DO NOT DM FOR SUPPORT.


:: We want to run as admin, no excuses. Don't even give the user the option. Prompt UAC as soon as this file is opened.
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

title Redist Installer

:: Make a temp place to store all the redists.
md %temp%\Redist-Installer >nul 2>&1
cd %temp%\Redist-Installer
:: Create the Plutonium folder ahead of time so we can whitelist.
md "%localappdata%\Plutonium" >nul 2>&1
md "%localappdata%\Plutonium-staging" >nul 2>&1
cls


echo Redist Installer
echo Written by Chase (https://chse.xyz)
echo This file will close when done, restart your computer after to be sure everything installed correctly.
echo.


:: Do this silently since this isn't for *just* plutonium anymore.
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "%localappdata%\Plutonium"
powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath "%localappdata%\Plutonium-staging"
cd %temp%\Redist-Installer
:: Grab redists
echo [1] Downloading Redists (This may take a while...)
echo Downloading 2015-2019...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/vs/16/release/vc_redist.x86.exe', 'vcredist2015_2017_2019_x86.exe')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/vs/16/release/vc_redist.x64.exe', 'vcredist2015_2017_2019_x64.exe')"
echo Downloading 2013...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/highdpimfc2013x64enu', '2013_x64.exe')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/highdpimfc2013x86enu', '2013_x86.exe')"
echo Downloading 2012...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe', '2012_x64.exe')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe', '2012_x86.exe')"
echo Downloading 2010...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe', '2010_x86.exe')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe', '2010_x64.exe')"
:: 2008 is no longer on M$'s website. 4/24/2021
::echo Downloading 2008...
::powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/1/1/1116b75a-9ec3-481a-a3c8-1777b5381140/vcredist_x86.exe', '2008_x86.exe')"
::powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/d/2/4/d242c3fb-da5a-4542-ad66-f9661d0a8d19/vcredist_x64.exe', '2008_x64.exe')"

:: Run VCRedist as silent
echo [2] Installing VCRedist (This may take a while...)
echo Installing 2015-2019 32...
vcredist2015_2017_2019_x86.exe /install /quiet /norestart
echo Installing 2015-2019 64...
vcredist2015_2017_2019_x64.exe /install /quiet /norestart
echo Installing 2013 32...
2013_x86.exe /install /quiet /norestart
echo Installing 2013 64...
2013_x64.exe /install /quiet /norestart
echo Installing 2012 32...
2012_x86.exe /install /quiet /norestart
echo Installing 2012 64...
2012_x64.exe /install /quiet /norestart
echo Installing 2010 32...
2010_x86.exe /install /quiet /norestart
echo Installing 2010 64...
2010_x64.exe /install /quiet /norestart
::echo Installing 2008 32...
::2008_x86.exe /install /quiet /norestart
::echo Installing 2008 64...
::2008_x64.exe /install /quiet /norestart


:: DirectX unzip & run
echo [3] Installing DirectX (This may take a while...)
echo Downloading DirectX (id 35)...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/710609237805498500/804707669428535366/dxwebsetup.exe', 'DirectX.exe')"
:: M$ 404'd this on 1/29/2021 -- This is a copy from archive.org, so we are **still** using official M$ files.
echo Installing DirectX (id 35)...
start /wait DirectX.exe /Q
echo Downloading DirectX (9.0c Addons)...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/710609237805498500/785666488219992084/DX90c_Addon_Installer.exe', 'DirectXA.exe')"
echo Installing DirectX (9.0c Addons)...
start /wait DirectXA.exe /silent

:: .NET unzip & run
echo [4] Installing .NET (This may take a while...)
echo Downloading .NET...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://go.microsoft.com/fwlink/?LinkId=863262', 'dotNET.exe')"
echo Installing .NET...
start /wait dotNET.exe /Q

cls
echo [4] Cleaning up...
rmdir %temp%\Redist-Installer /s /q
exit
