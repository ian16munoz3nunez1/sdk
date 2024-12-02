@ECHO off
SET InstallDir="%ProgramFiles%\MEI\Bnr WinUSB Driver"
IF NOT EXIST %InstallDir% GOTO alreadyUninstalled
pushd %InstallDir%
unins000.exe unins000.dat /VERYSILENT /NOCANCEL /NORESTART /DIR="%InstallDir%" /LOG /SUPPRESSMSGBOXES /SP-
set result=%errorlevel%
popd
echo unins000 return %result%
if not %result%==9009 goto end
:alreadyUninstalled
echo USB Driver was already uninstalled
PAUSE
:end
@ECHO on