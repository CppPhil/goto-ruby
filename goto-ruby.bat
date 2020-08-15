@echo off

SET DIR=%~dp0

SET WINDATA=%DIR%\windows_data

SET RUBY_BASE_DIR=%WINDATA%\ruby
SET RUBY_BIN=%RUBY_BASE_DIR%\rubyinstaller-2.6.3-1-x86\bin
SET RUBY_EXE=%RUBY_BIN%\ruby.exe
SET RUBY_ARCHIVE=%WINDATA%\rubyinstaller-2.6.3-1-x86.7z

SET SEVEN_ZIP_DIR=%WINDATA%\7z
SET SEVEN_ZIP_INSTALLER=%WINDATA%\7z1900.exe
SET SEVEN_ZIP_EXE=%SEVEN_ZIP_DIR%\7z.exe

if not exist "%RUBY_EXE%" (
    mkdir "%SEVEN_ZIP_DIR%"
    "%SEVEN_ZIP_INSTALLER%" /S /D="%SEVEN_ZIP_DIR%"

    mkdir "%RUBY_BASE_DIR%"
    "%SEVEN_ZIP_EXE%" x "%RUBY_ARCHIVE%" -y -o"%RUBY_BASE_DIR%" > nul
)

If "%~1"=="" goto HELP

If "%~1"=="--help" goto HELP

If "%~1"=="-h" goto HELP

If "%~1"=="-?" goto HELP

If "%~1"=="/help" goto HELP

If "%~1"=="/h" goto HELP

If "%~1"=="/?" goto HELP

"%RUBY_EXE%" %*
if errorlevel 1 (
    exit /b 1
)
exit /b 0

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
