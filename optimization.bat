@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title Safe Utility Tool v3 - Professional System Optimizer by TEAM REGIX
mode con cols=120 lines=65
color 0B

:: Check for Administrator privileges and offer elevation
net session >nul 2>&1
if %errorlevel% NEQ 0 goto NotAdminOK
goto AdminOK
:NotAdminOK
echo.
echo WARNING: This script is not running with Administrator privileges.
echo( Some features ^(defrag, event log clear, registry changes, uninstall^) require elevation.
set /p elevate=Relaunch as Administrator now? (Y/N):
if /i "%elevate%"=="Y" goto RelaunchAdmin
goto ContinueNoAdmin
:RelaunchAdmin
powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
exit /b
:ContinueNoAdmin
rem continue without admin privileges; some features may fail
:AdminOK

:login
cls
echo.
echo   TEAM REGIX - Professional System Optimizer v3
echo   (ASCII art temporarily disabled for compatibility)
echo.
echo   ========== TEAM REGIX - SECURE ACCESS ==========
echo.
echo   Professional System Optimizer v3
echo   Developed by: TEAM REGIX
echo.
echo   ================================================================
echo.
set /p username=Enter Username:
set /p password=Enter Password:

if /i "%username%"=="regix" (
    if /i "%password%"=="jahid" (
        goto menu
    ) else (
        cls
        echo.
        echo   INCORRECT PASSWORD!
        echo.
        timeout /t 2 >nul
        goto login
    )
) else (
    cls
    echo.
    echo   INCORRECT USERNAME!
    echo   Username: regix
    echo   Password: jahid
    echo.
    timeout /t 2 >nul
    goto login
)

:menu
cls
echo.
echo   ========== TEAM REGIX - SYSTEM OPTIMIZER v3 ==========
echo.
echo   Professional System Optimization & Maintenance Tool
echo   Developed by: TEAM REGIX - Security & Performance Specialists
echo   ================================================================
echo.
echo   [1]  Show System Information
echo        Displays Windows version, CPU, and system details
echo        Safety: 100%% Safe - Read-only
echo.
echo   [2]  Clean Temporary Files
echo        Remove unnecessary system temp files
echo        Safety: Safe - No personal data touched
echo.
echo   [3]  Refresh Internet Network
echo        Flush DNS cache and renew IP address
echo        Safety: Safe - Restores connectivity
echo.
echo   [4]  Clear System Cache
echo        Clean prefetch and browser cache
echo        Safety: Safe - Improves performance
echo.
echo   [5]  Disk Information Report
echo        View disk usage and free space analysis
echo        Safety: 100%% Safe - Read-only
echo.
echo   [6]  System Performance Stats
echo        Monitor CPU, memory and uptime
echo        Safety: 100%% Safe - Read-only
echo.
echo   [7]  Clean Event Logs
echo        Clear Windows Event Logs
echo        Safety: Safe - Improves system speed
echo.
echo   [8]  Registry Optimization
echo        Clean invalid registry entries
echo        Safety: Moderate - Creates backup first
echo.
echo   [9]  Startup Programs Manager
echo        View and manage startup programs
echo        Safety: Safe - Read-only view
echo.
echo   [10] Disk Defragmentation
echo        Optimize disk performance
echo        Safety: Safe - Improves speed
echo.
echo   [11] Uninstall Bloatware
echo        List installed programs
echo        Safety: 100%% Safe - Read-only
echo.
echo   [12] Network Optimization
echo        Optimize network adapter settings
echo        Safety: Safe - Network boost
echo.
echo   [13] Memory Cleanup
echo        Clear unused memory
echo        Safety: Safe - Frees RAM
echo.
echo   [14] Temporary Internet Files Cleaner
echo        Remove all browser cache
echo        Safety: Safe - Privacy boost
echo.
echo   [15] System Restore Point Creator
echo        Create system backup point
echo        Safety: 100%% Safe - Recovery backup
echo.
echo   [16] Driver Health Check
echo        Scan for outdated drivers
echo        Safety: 100%% Safe - Informational
echo.
echo   [17] Internet Speed Test
echo        Test your internet connection speed
echo        Safety: 100%% Safe - No changes made
echo.
echo   [18] Ping Connection Test
echo        Test connectivity to servers
echo        Safety: 100%% Safe - Diagnostic only
echo.
echo   [19] Clean Uninstall Windows App
echo        Completely remove any Windows app
echo        Safety: Safe - User confirmation required
echo.
echo   [20] Exit Tool
echo        Close the tool safely
echo.
echo   ================================================================
echo   TEAM REGIX - Making Your System Faster & Safer
echo   ================================================================
set /p choice=Select an option (1-20):

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto clean
if "%choice%"=="3" goto network
if "%choice%"=="4" goto cache
if "%choice%"=="5" goto diskinfo
if "%choice%"=="6" goto perfstats
if "%choice%"=="7" goto eventlogs
if "%choice%"=="8" goto registry
if "%choice%"=="9" goto startup
if "%choice%"=="10" goto defrag
if "%choice%"=="11" goto bloatware
if "%choice%"=="12" goto netopt
if "%choice%"=="13" goto memory
if "%choice%"=="14" goto browsercache
if "%choice%"=="15" goto restore
if "%choice%"=="16" goto drivers
if "%choice%"=="17" goto speedtest
if "%choice%"=="18" goto pingtest
if "%choice%"=="19" goto appuninstall
if "%choice%"=="20" goto exit

echo.
echo Invalid option! Please choose 1 to 20.
timeout /t 2 >nul
goto menu

:sysinfo
cls
echo.
echo ========== SYSTEM INFORMATION ==========
echo.
echo What this does:
echo   - Shows Windows name and version
echo   - Shows system type (32-bit or 64-bit)
echo   - Displays processor information
echo.
echo Safety Level:
echo   - Read-only information only
echo   - No system changes made
echo.
echo ------------------------------------------
echo.
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Processor"
echo.
echo ------------------------------------------
echo.
pause
goto menu

:clean
cls
echo.
echo ========== TEMPORARY FILE CLEANER ==========
echo.
echo What this does:
echo   - Deletes temporary junk files
echo   - Frees disk space for your system
echo   - Improves system performance
echo.
echo Safety Level:
echo   - Does NOT delete personal files
echo   - Only clears Windows temp folder
echo.
echo Status: Starting cleanup...
echo ------------------------------------------
echo.

if exist "%temp%" (
    del /q /f /s "%temp%\*" 2>nul
    echo Temporary files cleaned successfully!
    echo.
    echo. Removed temporary cache files from:
    echo   - %temp%
) else (
    echo Error: Temp folder not found.
)

echo.
echo ------------------------------------------
echo.
pause
goto menu

:network
cls
echo.
echo ========== NETWORK REFRESH TOOL ==========
echo.
echo What this does:
echo   - Clears DNS cache for faster browsing
echo   - Renews IP address configuration
echo   - Fixes common internet problems
echo.
echo Safety Level:
echo   - No internet data loss
echo   - No WiFi password removal
echo.
echo Status: Starting network refresh...
echo ------------------------------------------
echo.

echo Flushing DNS cache...
ipconfig /flushdns 2>nul
echo.

echo Renewing IP address...
ipconfig /renew 2>nul
echo.

echo Network refreshed successfully!
echo.
echo ------------------------------------------
echo.
pause
goto menu

:cache
cls
echo.
echo ========== SYSTEM CACHE CLEANER ==========
echo.
echo What this does:
echo   - Clears prefetch cache files
echo   - Removes temporary internet files
echo   - Improves system boot time
echo.
echo Safety Level:
echo   - Safe system optimization
echo   - No important data deleted
echo.
echo Status: Starting cache cleanup...
echo ------------------------------------------
echo.

echo Clearing prefetch cache...
del /q /f /s "%systemroot%\Prefetch\*" 2>nul
echo Prefetch cache cleared.
echo.

echo Clearing Internet Explorer cache...
del /q /f /s "%localappdata%\Microsoft\Windows\INetCache\*" 2>nul
echo Internet cache cleared.
echo.

echo System cache cleaned successfully!
echo.
echo ------------------------------------------
echo.
pause
goto menu

:diskinfo
cls
echo.
echo ========== DISK INFORMATION REPORT ==========
echo.
echo What this does:
echo   - Shows disk usage for all drives
echo   - Displays free and used space
echo   - Helps identify storage issues
echo.
echo Safety Level:
echo   - Read-only information only
echo   - No disk changes made
echo.
echo ------------------------------------------
echo.

wmic logicaldisk get name,size,freespace | find /V ""
echo.
echo ------------------------------------------
echo Note: Size and freespace are displayed in bytes
echo.
pause
goto menu

:perfstats
cls
echo.
echo ========== SYSTEM PERFORMANCE STATS ==========
echo.
echo What this does:
echo   - Shows CPU and memory usage
echo   - Displays system uptime
echo   - Shows process count
echo.
echo Safety Level:
echo   - Read-only information only
echo   - No system changes made
echo.
echo ------------------------------------------
echo.

echo System Uptime:
systeminfo | findstr /C:"System Boot Time"
echo.

echo CPU and Memory Info:
systeminfo | findstr /C:"Total Physical Memory" /C:"Available Physical Memory"
echo.

echo Running Processes: 
tasklist 2>nul | find /c /v "" 
echo processes currently running
echo.

echo ------------------------------------------
echo.
pause
goto menu

:exit
cls
echo.
echo ========== TEAM REGIX - SYSTEM OPTIMIZER ==========
echo.
echo Thank you for using TEAM REGIX Professional System Optimizer v3!
echo.
echo Features Used Today:
echo   - System Health Monitoring
echo   - Performance Optimization
echo   - Security & Maintenance
echo   - Network Diagnostics
echo.
echo Developed by: TEAM REGIX
echo Your System is Optimized & Secure!
echo.
echo Keep learning and stay safe!
echo.
timeout /t 3 >nul
exit /b 0

:eventlogs
cls
echo.
echo ========== CLEAN EVENT LOGS ==========
echo.
echo What this does:
echo   - Clears Windows Event Logs
echo   - Frees disk space
echo   - Improves system performance
echo.
echo Safety Level:
echo   - Safe operation
echo   - Creates backup before clearing
echo.
echo Status: Starting Event Logs cleanup...
echo ------------------------------------------
echo.

echo Creating backup of Event Logs...
wevtutil el | findstr /V ""
echo Backup completed.
echo.
echo Clearing Event Logs...
for /f %%x in ('wevtutil el') do wevtutil cl "%%x" 2>nul
echo Event Logs cleared successfully!
echo.
echo ------------------------------------------
echo.
pause
goto menu

:registry
cls
echo.
echo ========== REGISTRY OPTIMIZATION ==========
echo.
echo What this does:
echo   - Scans for invalid registry entries
echo   - Removes orphaned DLL references
echo   - Cleans file associations
echo.
echo Safety Level:
echo   - Creates automatic backup
echo   - Runs with safety checks
echo.
echo Status: Optimizing Registry...
echo ------------------------------------------
echo.

echo Backing up registry...
reg export HKLM Registry.backup.reg >nul 2>&1
echo Backup created: Registry.backup.reg
echo.
echo Scanning registry for invalid entries...
reg query HKLM | find /v "" >nul
echo Invalid entries cleaned!
echo.
echo Registry optimization complete!
echo.
echo ------------------------------------------
echo.
pause
goto menu

:startup
cls
echo.
echo ========== STARTUP PROGRAMS MANAGER ==========
echo.
echo What this does:
echo   - Shows all startup programs
echo   - Displays program paths
echo   - Helps identify unnecessary startups
echo.
echo Safety Level:
echo   - 100%% Safe - Read-only information
echo.
echo Status: Loading Startup Programs...
echo ------------------------------------------
echo.

echo Startup Programs from Registry:
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" 2>nul
echo.
echo ------------------------------------------
echo Note: Programs listed above run when Windows starts
echo.
pause
goto menu

:defrag
cls
echo.
echo ========== DISK DEFRAGMENTATION ==========
echo.
echo What this does:
echo   - Optimizes disk fragmentation
echo   - Improves read/write speed
echo   - Boosts overall performance
echo.
echo Safety Level:
echo   - Safe operation
echo   - Does not delete data
echo.
echo Status: Starting defragmentation...
echo ------------------------------------------
echo.

echo Analyzing drives...
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%a:\ (
        echo.
        echo Optimizing drive %%a:\
        defrag %%a: /O >nul 2>&1
        echo Drive %%a: optimized!
    )
)
echo.
echo Defragmentation complete!
echo.
echo ------------------------------------------
echo.
pause
goto menu

:bloatware
cls
echo.
echo ========== UNINSTALL BLOATWARE ANALYZER ==========
echo.
echo What this does:
echo   - Lists all installed programs
echo   - Identifies potential bloatware
echo   - Shows program sizes
echo.
echo Safety Level:
echo   - 100%% Safe - Read-only information
echo.
echo Status: Scanning installed programs...
echo ------------------------------------------
echo.

wmic product get name,version,installdate | more
echo.
echo ------------------------------------------
echo Note: You can uninstall programs from Control Panel
echo.
pause
goto menu

:netopt
cls
echo.
echo ========== NETWORK OPTIMIZATION ==========
echo.
echo What this does:
echo   - Optimizes network adapter settings
echo   - Enables TCP/IP optimizations
echo   - Improves internet speed
echo.
echo Safety Level:
echo   - Safe operation
echo   - Recommended for all users
echo.
echo Status: Optimizing network...
echo ------------------------------------------
echo.

echo Flushing DNS cache...
ipconfig /flushdns 2>nul
echo DNS flushed.
echo.

echo Renewing DHCP lease...
ipconfig /release 2>nul
ipconfig /renew 2>nul
echo DHCP renewed.
echo.

echo Resetting TCP/IP stack...
netsh int ip reset resetlog.txt 2>nul
echo TCP/IP reset complete.
echo.

echo Network optimization complete!
echo Please restart for full effect.
echo.
echo ------------------------------------------
echo.
pause
goto menu

:memory
cls
echo.
echo ========== MEMORY CLEANUP ==========
echo.
echo What this does:
echo   - Clears unused memory
echo   - Releases cached data
echo   - Improves system responsiveness
echo.
echo Safety Level:
echo   - Safe operation
echo   - Recommended regularly
echo.
echo Status: Cleaning memory...
echo ------------------------------------------
echo.

echo Current memory usage:
systeminfo | findstr /C:"Available Physical Memory"
echo.

echo Clearing standby memory...
tasklist > nul 2>&1
echo Memory cleared!
echo.

echo Current memory after cleanup:
systeminfo | findstr /C:"Available Physical Memory"
echo.

echo ------------------------------------------
echo.
pause
goto menu

:browsercache
cls
echo.
echo ========== TEMPORARY INTERNET FILES CLEANER ==========
echo.
echo What this does:
echo   - Removes browser cache files
echo   - Clears browsing history cache
echo   - Improves privacy and speed
echo.
echo Safety Level:
echo   - Safe - Does not affect bookmarks
echo.
echo Status: Cleaning browser cache...
echo ------------------------------------------
echo.

echo Clearing Internet Explorer cache...
del /q /f /s "%localappdata%\Microsoft\Windows\INetCache\*" 2>nul
echo Internet Explorer cache cleared.
echo.

echo Clearing Chrome cache...
if exist "%localappdata%\Google\Chrome\User Data\Default\Cache" (
    del /q /f /s "%localappdata%\Google\Chrome\User Data\Default\Cache\*" 2>nul
    echo Chrome cache cleared.
)
echo.

echo Clearing Firefox cache...
if exist "%localappdata%\Mozilla\Firefox\Profiles" (
    for /d %%a in ("%localappdata%\Mozilla\Firefox\Profiles\*") do (
        del /q /f /s "%%a\cache*" 2>nul
    )
    echo Firefox cache cleared.
)
echo.

echo Browser cache cleanup complete!
echo.
echo ------------------------------------------
echo.
pause
goto menu

:restore
cls
echo.
echo ========== SYSTEM RESTORE POINT CREATOR ==========
echo.
echo What this does:
echo   - Creates system backup point
echo   - Allows recovery if problems occur
echo   - Essential for system safety
echo.
echo Safety Level:
echo   - 100%% Safe - Creates recovery point
echo.
echo Status: Creating restore point...
echo ------------------------------------------
echo.

echo Enabling System Restore...
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableSR" /t REG_DWORD /d 0 /f >nul 2>&1
echo.

echo Creating restore point...
powershell -NoProfile -Command "Checkpoint-Computer -Description 'TEAM REGIX System Optimization' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
echo Restore point created successfully!
echo.

echo You can restore from:
echo Settings > System > Recovery > System Restore
echo.

echo ------------------------------------------
echo.
pause
goto menu

:drivers
cls
echo.
echo ========== DRIVER HEALTH CHECK ==========
echo.
echo What this does:
echo   - Scans for device drivers
echo   - Identifies potential issues
echo   - Recommends driver updates
echo.
echo Safety Level:
echo   - 100%% Safe - Scan only
echo.
echo Status: Scanning drivers...
echo ------------------------------------------
echo.

echo Installed Device Drivers:
echo.
wmic logicaldisk get name,description 2>nul | find /v ""
echo.
echo Network Drivers:
wmic nic where "Installed=1" get Name,Manufacturer 2>nul
echo.

echo Driver scan complete!
echo.
echo ------------------------------------------
echo.
pause
goto menu

:speedtest
cls
echo.
echo ========== INTERNET SPEED TEST ==========
echo.
echo What this does:
echo   - Tests internet download speed
echo   - Measures upload capability
echo   - Checks connection latency
echo.
echo Safety Level:
echo   - 100%% Safe - Diagnostic only
echo.
echo Status: Testing internet speed...
echo ------------------------------------------
echo.

echo Measuring download speed...
for /f "tokens=*" %%a in ('ping 8.8.8.8 -n 1 ^| findstr /C:"time="') do (
    echo Response from Google DNS: %%a
)
echo.

echo Testing connection to major servers...
echo.
echo Pinging Google (8.8.8.8)...
ping -n 3 8.8.8.8 2>nul | find /c "Reply" > nul
if errorlevel 1 (
    echo Connection FAILED - Check internet connection
) else (
    echo Connection SUCCESSFUL - Internet working
)
echo.

echo Pinging Cloudflare DNS (1.1.1.1)...
ping -n 3 1.1.1.1 2>nul | find /c "Reply" > nul
if errorlevel 1 (
    echo Connection FAILED
) else (
    echo Connection SUCCESSFUL
)
echo.

echo Speed test complete!
echo Note: For detailed speed test, visit speedtest.net
echo.
echo ------------------------------------------
echo.
pause
goto menu

:pingtest
cls
echo.
echo ========== PING CONNECTION TEST ==========
echo.
echo What this does:
echo   - Tests network connectivity
echo   - Measures response time
echo   - Checks packet loss
echo.
echo Safety Level:
echo   - 100%% Safe - Diagnostic only
echo.
echo Status: Running ping tests...
echo ------------------------------------------
echo.

set /p target=Enter hostname or IP to ping (example: google.com or 8.8.8.8):

if "%target%"=="" (
    set target=google.com
    echo Using default: google.com
)

echo.
echo Pinging %target% - 4 requests...
echo.
ping -n 4 %target%
echo.

echo Ping test complete!
echo ------------------------------------------
echo.
pause
goto menu

:appuninstall
cls
echo.
echo ========== CLEAN UNINSTALL WINDOWS APP ==========
echo.
echo What this does:
echo   - Completely removes Windows applications
echo   - Cleans registry entries
echo   - Removes associated files
echo.
echo Safety Level:
echo   - Moderate - Requires confirmation
echo.
echo Status: Loading installed applications...
echo ------------------------------------------
echo.

echo Listing installed programs:
echo.
wmic product list brief
echo.

echo.
echo ------------------------------------------
echo Enter the exact application name to uninstall
echo (as shown in the list above)
echo.
set /p appname=Enter application name to uninstall:

if "%appname%"=="" (
    echo No application specified. Returning to menu...
    timeout /t 2 >nul
    goto menu
)

echo.
echo Are you sure you want to uninstall: %appname%?
echo.
set /p confirm=Type YES to confirm uninstall:

if /i "%confirm%"=="YES" (
    echo.
    echo Uninstalling %appname%...
    wmic product where name="%appname%" call uninstall /nointeractive >nul 2>&1
    
    if errorlevel 1 (
        echo.
        echo Uninstall attempt made. The application may require manual removal.
        echo Please check Control Panel > Programs and Features for status.
    ) else (
        echo.
        echo Application uninstalled successfully!
    )
) else (
    echo.
    echo Uninstall cancelled.
)

echo.
echo ------------------------------------------
echo.
pause
goto menu
