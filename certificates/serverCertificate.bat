@echo off

if not exist %1 (md %1)
@REM if not exist "\TCx SDK\DeviceBroker\conf\keystore" (md "\TCx SDK\DeviceBroker\conf\keystore")

rem Generate Server Key JKS File
keytool -genkeypair -alias sdk-wss -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore %1\sdk-wss.jks -storepass tcxsdk -keypass tcxsdk -noprompt
@REM keytool -genkeypair -alias sdk-wss -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.jks" -storepass tcxsdk -keypass tcxsdk -noprompt

rem Export Server Key to .cer File
keytool -exportcert -alias sdk-wss -keystore %1\sdk-wss.jks -file %1\sdk-wss.cer -storepass tcxsdk -noprompt
@REM keytool -exportcert -alias sdk-wss -keystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.jks" -file "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.cer" -storepass tcxsdk -noprompt

rem Convert Server JKS to PKCS12
keytool -importkeystore -srckeystore %1\sdk-wss.jks -destkeystore %1\sdk-wss.p12 -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt
@REM keytool -importkeystore -srckeystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.jks" -destkeystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt

rem Extract Server Key using OpenSSL
openssl pkcs12 -in %1\sdk-wss.p12 -nocerts -nodes -out %1\sdk-wss.key -passin pass:tcxsdk
@REM openssl pkcs12 -in "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.p12" -nocerts -nodes -out "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.key" -passin pass:tcxsdk

rem Create PEM File from Server Key
openssl rsa -in %1\sdk-wss.key -out %1\sdk-wss.pem
@REM openssl rsa -in "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.key" -out "\TCx SDK\DeviceBroker\conf\keystore\sdk-wss.pem"
