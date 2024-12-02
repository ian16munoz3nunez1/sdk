@echo off

if not exist %1 (md %1)
@REM if not exist "\TCx SDK\DeviceBroker\conf\keystore" (md "\TCx SDK\DeviceBroker\conf\keystore")

explorer %1
@REM explorer "\TCx SDK\DeviceBroker\conf\keystore"

@REM Generate CA Key JKS File
keytool -genkeypair -alias sdk-ca -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore %1\sdk-ca.jks -storepass tcxsdk -keypass tcxsdk -noprompt
@REM keytool -genkeypair -alias sdk-ca -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.jks" -storepass tcxsdk -keypass tcxsdk -noprompt

@REM Export CA Key to .cer File
keytool -exportcert -alias sdk-ca -keystore %1\sdk-ca.jks -file %1\sdk-ca.cer -storepass tcxsdk -noprompt
@REM keytool -exportcert -alias sdk-ca -keystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.jks" -file "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.cer" -storepass tcxsdk -noprompt

@REM Convert CA JKS to PKCS12
keytool -importkeystore -srckeystore %1\sdk-ca.jks -destkeystore %1\sdk-ca.p12 -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt
@REM keytool -importkeystore -srckeystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.jks" -destkeystore "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt

@REM Extract CA Key using OpenSSL
openssl pkcs12 -in %1\sdk-ca.p12 -nocerts -nodes -out %1\sdk-ca.key -passin pass:tcxsdk
@REM openssl pkcs12 -in "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.p12" -nocerts -nodes -out "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.key" -passin pass:tcxsdk

@REM Create PEM File from CA Key
openssl rsa -in %1\sdk-ca.key -out %1\sdk-ca.pem
@REM openssl rsa -in "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.key" -out "\TCx SDK\DeviceBroker\conf\keystore\sdk-ca.pem"
