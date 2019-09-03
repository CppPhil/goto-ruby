@echo off

REM TODO check if Ruby is already there

SET DIR=%~dp0

mkdir %DIR%\windows_data\7z
%DIR%\windows_data\7z1900.exe /S /D="%DIR%\windows_data\7z"

mkdir %DIR%\windows_data\ruby
%DIR%\windows_data\7z\7z.exe x %DIR%\windows_data\rubyinstaller-2.6.3-1-x86.7z -y -o%DIR%\windows_data\ruby > nul

If "%~1"=="" goto HELP

If "%~1"=="--help" goto HELP

If "%~1"=="-h" goto HELP

If "%~1"=="-?" goto HELP

If "%~1"=="/help" goto HELP

If "%~1"=="/h" goto HELP

If "%~1"=="/?" goto HELP

%DIR%\windows_data\ruby\rubyinstaller-2.6.3-1-x86\bin\rubyw.exe "%*"
exit /b 0

:HELP
    echo "Usage: %~0 [options] script.rb [arguments]..."
    echo "goto-ruby launches a ruby script."
    echo ""
    echo "Example:"
    echo "  %~0 build.rb Debug"
    echo ""
    echo "Options:"
    echo "  -?, /?, -h, /h, --help, /help    give this help list"
    exit /b 1
