@ECHO OFF
setlocal enableDelayedExpansion
cls

:: ---------------------------------------------------------------------------------
:: Variable declarations
:: ---------------------------------------------------------------------------------
set DIST=docs\.vuepress\dist
set OUTPUTDIRECTORY=Dropbox
set OUTPUTPATH=%USERPROFILE%\%OUTPUTDIRECTORY%

:: ---------------------------------------------------------------------------------
:: Main procedure
:: ---------------------------------------------------------------------------------
call :log "Starting Deployment..."
call :change
call :commit
call :push
call :backup
goto Exit

:: ---------------------------------------------------------------------------------
:: Go To Distribution Folder
:: ---------------------------------------------------------------------------------
:change
call :log "Change Directory to %DIST%"
cd %DIST%
goto:EOF

:: ---------------------------------------------------------------------------------
:: Commit
:: ---------------------------------------------------------------------------------
:commit
call :log "Initilize git Repo"
git init
git add -A
git commit -m 'deploy'
goto:EOF

:: ---------------------------------------------------------------------------------
:: Push
:: ---------------------------------------------------------------------------------
:push
call :log "Push the Changes"
git push -f git@github.source.internal.cba:hiremapr/25prabhu10.github.io.git master
goto:EOF

:: ---------------------------------------------------------------------------------
:: Copy files to Dropbox
:: ---------------------------------------------------------------------------------
:backup
cd ..\..\..
ROBOCOPY .\docs %OUTPUTPATH% /mir /njh /njs /ndl /nc /ns /xd .vuepress
call :log "Copied files to Dropbox"
goto:EOF

:: ---------------------------------------------------------------------------------
:: Log Output
:: ---------------------------------------------------------------------------------
:log
call :printDate
echo %~1
goto:EOF

:: ---------------------------------------------------------------------------------
:: Print Date
:: ---------------------------------------------------------------------------------
:printDate
for /f "tokens=2-4 delims=/ " %%a in ('echo %DATE%') do (
  set mydate=%%c/%%a/%%b)
for /f "tokens=1-3 delims=/:./ " %%a in ('echo %TIME%') do (
  set mytime=%%a:%%b:%%c)
echo|set /p="[%mydate% %mytime%] "
goto:EOF

:: ---------------------------------------------------------------------------------
:: End of script
:: ---------------------------------------------------------------------------------

:Exit
