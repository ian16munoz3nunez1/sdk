@echo off

powershell -Command "Expand-Archive C:\POS\drivers\javaxusb_lights\javaxusb_lights.zip C:\POS\drivers\javaxusb_lights"

copy "C:\POS\drivers\javaxusb_lights\javaxusb.sys" "C:\POS\drivers\oem\psc\"

setx /m path "%PATH%;C:\POS\bin"

aipdifx.exe -i "C:\POS\drivers\javaxusb_lights\javaxusb_lights.inf" -v

aipdifx.exe -i "C:\POS\drivers\oem\psc\javaxusb_oem_psc.inf" -v

"%1\sdk.msi"

"%1\Win\SCO\S7\BNR USB Driver\setupBNRWinUSBDriver.exe"

"%1\Win\SCO\S7\BCR COM Driver\BCRVCPInstaller_x64.exe"

setx /m path "%PATH%;C:\TCx SDK\DeviceBroker\lib\dll"

setx /m path "%PATH%;C:\TCx SDK\DeviceBroker\lib\extn"

copy "%1\Win\SCO\S7\jposSDK.xml" "C:\POS\JavaPOS\jpos.xml"

copy "%1\Win\SCO\S7\enableLights.conf" "C:\POS\JavaPOS\Config\enableLights.conf"

devmgmt.msc

notepad "C:\POS\JavaPOS\jpos.xml"

