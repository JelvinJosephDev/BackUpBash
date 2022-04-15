@echo OFF
echo [Task] Starting backup sequence...
echo [Task] Creating backup directory...
:: %%c - year , %%a - month , %%b - date
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c.%%a.%%b)
:: Example 
:: mkdir "E:\Backup\%mydate%"
mkdir "<DRIVE>:\PATH\%mydate%"

set destinationPath="<DRIVE>:\PATH\%mydate%"
set sourcePath="<DRIVE>:\PATH\FILE_OR_FOLDER"

echo [Task] Attempting to copy files...
IF EXIST %destinationPath% (IF EXIST %sourcePath% (set flag="true") ELSE (set flag="false")) ELSE (set flag="false")
IF %flag%=="true" (xcopy %sourcePath% %destinationPath% /i /c /f) ELSE (echo [Result] Backup failed.)
IF %flag%=="true" (echo [Result] Backup successful.) ELSE (echo Error occured during operation >> %destinationPath%\error.log)
IF %flag%=="true" (echo [Result] Backup sequence complete.) ELSE (echo [Result] Backup sequence failed.)

:: Timeout for 60 seconds so we can see the output of our code
timeout /t 60

:: Created by @Tatsuya#8082
