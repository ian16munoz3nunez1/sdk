@echo off

if not exist %1 (md %1)
@REM if not exist "\TCx SDK\DeviceBroker\conf\keystore" (md "\TCx SDK\DeviceBroker\conf\keystore")

rem Generate Client Key JKS File
keytool -genkeypair -alias sdk-client -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore %1\sdk-client.jks -storepass tcxsdk -keypass tcxsdk -noprompt
@REM keytool -genkeypair -alias sdk-client -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.jks" -storepass tcxsdk -keypass tcxsdk -noprompt

rem Export Client Key to .cer File
keytool -exportcert -alias sdk-client -keystore %1\sdk-client.jks -file %1\sdk-client.cer -storepass tcxsdk -noprompt
@REM keytool -exportcert -alias sdk-client -keystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.jks" -file "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.cer" -storepass tcxsdk -noprompt

rem Convert Client JKS to PKCS12
keytool -importkeystore -srckeystore %1\sdk-client.jks -destkeystore %1\sdk-client.p12 -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt
@REM keytool -importkeystore -srckeystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.jks" -destkeystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt

rem Extract Client Key using OpenSSL
openssl pkcs12 -in %1\sdk-client.p12 -nocerts -nodes -out %1\sdk-client.key -passin pass:tcxsdk
@REM openssl pkcs12 -in "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.p12" -nocerts -nodes -out "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.key" -passin pass:tcxsdk

rem Create PEM File from Client Key
openssl rsa -in %1\sdk-client.key -out %1\sdk-client.pem
@REM openssl rsa -in "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.key" -out "\TCx SDK\DeviceBroker\conf\keystore\sdk-client.pem"
