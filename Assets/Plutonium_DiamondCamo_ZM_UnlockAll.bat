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
::      https://cmh.pw/Pluto-Unlock
::      https://cmh.pw/Pluto-Unlock
::      https://cmh.pw/Pluto-Unlock
::      https://cmh.pw/Pluto-Unlock






:: Credits:
:: Pistakilla - Original thread creator
:: Cahz - Providing updated instructions for newer client revisions
:: Fry - Providing updated stats file with 10 CAC slots
:: erupt - ZM Portion (Shotgun Rank in ZM, a Full Bank, All of the perma-perks, and more)
:: Chase - Convert to BAT for easy installation.

:: MP Thread: https://forum.plutonium.pw/topic/3810/release-mp-diamond-camo-unlocker-10-cac-slots
:: ZM Thread: https://forum.plutonium.pw/topic/56/release-shotgun-rank-max-bank-all-perma-perks

:: File Location: 
::     %localappdata%\Plutonium\storage\demonware\18397\user

echo WARNING:
echo This tool will erase your current level, prestige, classes, and all ZM progress.
echo Backup your stat file(s) if you want to ever revert.
echo (%LocalAppData%\Plutonium\storage\demonware\18397\user)
echo.
echo Press any key to continue.
pause>nul

:: Remove all current stat files
cd /D %localappdata%\Plutonium\storage\demonware\18397\user
del /F /Q *
:: Download new stat files
echo Downloading MP Data...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://files.catbox.moe/ew7ct0', 'mpstatsCompressed')"
echo Downloading ZM Data (1/2)...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://files.catbox.moe/7eriql', 'zmstatsCompressed')"
echo Downloading ZM Data (2/2)...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://files.catbox.moe/26qpz7', 'zmdatabk0000')"
clear
echo Done! Enjoy.
echo.
echo Press any key to close.
pause>nul
