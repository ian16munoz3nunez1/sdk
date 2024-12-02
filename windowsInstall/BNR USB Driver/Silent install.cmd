@echo off
setlocal
set _fileDir=%~dp0

echo Installing BNR WinUSB driver, please wait ...
"%_fileDir%\setupBNRWinUSBDriver.exe" /verysilent /suppressmsgboxes
echo.
if not %errorlevel% EQU 0 goto error

echo Installation done without error.
goto end

:error
echo Error %errorlevel% during installation.
echo.

:end
endlocal
