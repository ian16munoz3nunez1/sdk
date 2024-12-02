@echo off

powershell -Command "Expand-Archive C:\POS\drivers\javaxusb_lights\javaxusb_lights.zip C:\POS\drivers\javaxusb_lights"

copy "C:\POS\drivers\javaxusb_lights\javaxusb.sys" "C:\POS\drivers\oem\psc\"

setx /m path "%PATH%;C:\POS\bin"

aipdifx.exe -i "C:\POS\drivers\javaxusb_lights\javaxusb_lights.inf" -v

aipdifx.exe -i "C:\POS\drivers\oem\psc\javaxusb_oem_psc.inf" -v

"%1\sdk.msi"

"%1\setupBNRWinUSBDriver.exe"

"%1\BCRVCPInstaller_x64.exe"

setx /m path "%PATH%;C:\TCx SDK\DeviceBroker\lib\dll"

setx /m path "%PATH%;C:\TCx SDK\DeviceBroker\lib\extn"

setx /m LD_LIBRARY_PATH "C:\Program Files\ojdkbuild\java-1.8.0-openjdk-1.8.0.332-1\jre\lib\amd64;C:\TCx SDK\DeviceBroker\lib\dll;C:\TCx SDK\DeviceBroker\lib\extn"

copy "%1\jpos.xml" "C:\POS\JavaPOS\jpos.xml"

copy "%1\enableLights.conf" "C:\POS\JavaPOS\Config\enableLights.conf"

devmgmt.msc

notepad "C:\POS\JavaPOS\jpos.xml"

