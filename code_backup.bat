@echo off
setlocal enabledelayedexpansion

:: Get the drive letter where the script is running
set "external_drive=%~d0"
set "source_folder=C:\Users\emilio.carreon\Documents\Dev"
set "temp_folder=%external_drive%\temp"

:: Get the current date and time
for /f "tokens=1-5 delims=/: " %%a in ("%date% %time%") do (
    set year=%%c
    set month=%%a
    set day=%%b
    set hour=%%d
    set minute=%%e
)

:: Format the timestamp as YYYYMMDD-HHMM
set "timestamp=%year%%month%%day%-%hour%%minute%"

:: Set the target folder name using the timestamp
set "target_folder=%external_drive%\%timestamp%"

:: Create target directory structure on the external drive, only if it doesn't exist
if not exist "%temp_folder%" mkdir "%temp_folder%"

:: Path to 7-Zip (set this to the correct path of 7z.exe)
set "sevenzip_path=C:\Program Files\7-Zip\7z.exe"

:: Record the start time
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set "start_hour=%%a"
    set "start_minute=%%b"
    set "start_second=%%c"
    set "start_millisecond=%%d"
)

:: Initialize progress counter
set /a counter=0

:: Count the total number of operations (subfolders in Projects + Queries + final compression)
set /a total=0
for /d %%D in ("%source_folder%\Projects\*") do (
    set /a total+=1
)
set /a total+=2

:: Compress each subfolder in Projects using 7-Zip
for /d %%D in ("%source_folder%\Projects\*") do (
    set /a counter+=1
    set "folder_name=%%~nxD"
    echo Compressing %%D... [ !counter!/%total% ]
    :: Ensure folder exists before attempting to create it
    if not exist "%temp_folder%\Projects" mkdir "%temp_folder%\Projects"
    "%sevenzip_path%" a "%temp_folder%\Projects\!folder_name!.7z" "%%D\*" -mx=9
)

:: Compress Queries using 7-Zip
set /a counter+=1
echo Compressing Queries... [ !counter!/%total% ]
"%sevenzip_path%" a "%temp_folder%\Queries.7z" "%source_folder%\Queries\*" -mx=9

:: Compress the entire structure into a final archive on the external drive using 7-Zip
set /a counter+=1
echo Compressing Dev... [ !counter!/%total% ]
"%sevenzip_path%" a "%target_folder%.7z" "%temp_folder%\*" -mx=9

:: Cleanup temporary files
rd /s /q "%temp_folder%"

:: Record the end time
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set "end_hour=%%a"
    set "end_minute=%%b"
    set "end_second=%%c"
    set "end_millisecond=%%d"
)

:: Calculate the elapsed time
set /a start_seconds=%start_hour% * 3600 + %start_minute% * 60 + %start_second%
set /a end_seconds=%end_hour% * 3600 + %end_minute% * 60 + %end_second%
set /a elapsed_seconds=end_seconds - start_seconds

:: Calculate hours, minutes, and seconds from elapsed seconds
set /a elapsed_hours=elapsed_seconds / 3600
set /a elapsed_minutes=(elapsed_seconds %% 3600) / 60
set /a elapsed_seconds=(elapsed_seconds %% 3600) %% 60

:: Display the elapsed time
echo Total execution time: !elapsed_hours! hours !elapsed_minutes! minutes !elapsed_seconds! seconds

echo Done! All operations completed.
pause
