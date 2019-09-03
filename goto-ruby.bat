@echo off

SET DIR=%~dp0 REM Path to the directory containing this script

SET WINDATA=%DIR%\windows_data REM Path to the windows_data subdirectory

REM Ruby related paths
SET RUBY_BASE_DIR=%WINDATA%\ruby REM Path to the ruby directory where the ruby installation will go
SET RUBY_BIN=%RUBY_BASE_DIR%\rubyinstaller-2.6.3-1-x86\bin REM The ruby bin directory containing ruby.exe
SET RUBY_EXE=%RUBY_BIN%\ruby.exe REM Path to ruby.exe
SET RUBY_ARCHIVE=%WINDATA%\rubyinstaller-2.6.3-1-x86.7z REM Path to the archive containing ruby

REM 7z related paths
SET SEVEN_ZIP_DIR=%WINDATA%\7z REM Path to the directory where 7z will be installed into
SET SEVEN_ZIP_INSTALLER=%WINDATA%\7z1900.exe REM Path to the 7z installer
SET SEVEN_ZIP_EXE=%SEVEN_ZIP_DIR%\7z.exe REM Path to the 7z executable

REM Do we need to create ruby?
if not exist %RUBY_EXE% (
    mkdir %SEVEN_ZIP_DIR%
    %SEVEN_ZIP_INSTALLER% /S /D="%SEVEN_ZIP_DIR%" REM Install 7z locally

    mkdir %RUBY_BASE_DIR%
    %SEVEN_ZIP_EXE% x %RUBY_ARCHIVE% -y -o%RUBY_BASE_DIR% > nul REM Unpack ruby
)

REM Check if we shall display the help
If "%~1"=="" goto HELP

If "%~1"=="--help" goto HELP

If "%~1"=="-h" goto HELP

If "%~1"=="-?" goto HELP

If "%~1"=="/help" goto HELP

If "%~1"=="/h" goto HELP

If "%~1"=="/?" goto HELP

REM Run ruby passing along the command line arguments received
%RUBY_EXE% %*
exit /b 0

REM Label to show the help list
:HELP
    echo Usage: %~0 [options] script.rb [arguments]...
    echo goto-ruby launches a ruby script.
    echo.
    echo Example:
    echo   %~0 build.rb Debug
    echo.
    echo Options:
    echo   -?, /?, -h, /h, --help, /help    give this help list
    exit /b 1
