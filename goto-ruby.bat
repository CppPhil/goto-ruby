@echo off

REM TODO check if Ruby is already there

SET DIR=%~dp0

mkdir %DIR%\windows_data\7z
%DIR%\windows_data\7z1900.exe /S /D="%DIR%\windows_data\7z"

mkdir %DIR\windows_data\ruby
%DIR%\windows_data\7z\7z.exe x %DIR%\windows_data\rubyinstaller-2.6.3-1-x86.7z -o%DIR%\windows_data\ruby


