#!/bin/bash

vim ${1-/opt/tgcs/javapos/config/jpos.xml}
[ ! -f /opt/tgcs/javapos/etc/enableLights.conf ] && touch /opt/tgcs/javapos/etc/enableLights.conf

if [ ! -d /mnt/f/adxetc/ext/adxqrsdk/conf/keystore ];
then
    mkdir -p keystore/

    echo "Creating CA Certificates"
    # Generate CA Key JKS File
    keytool -genkeypair -alias sdk-ca -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "keystore/sdk-ca.jks" -storepass tcxsdk -keypass tcxsdk -noprompt
    # Export CA Key to .cer File
    keytool -exportcert -alias sdk-ca -keystore "keystore/sdk-ca.jks" -file "keystore/sdk-ca.cer" -storepass tcxsdk -noprompt
    # Convert CA JKS to PKCS12
    keytool -importkeystore -srckeystore "keystore/sdk-ca.jks" -destkeystore "keystore/sdk-ca.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt
    # Extract CA Key using OpenSSL
    openssl pkcs12 -in "keystore/sdk-ca.p12" -nocerts -nodes -out "keystore/sdk-ca.key" -passin pass:tcxsdk
    # Create PEM File from CA Key
    openssl rsa -in "keystore/sdk-ca.key" -out "keystore/sdk-ca.pem"
    
    echo "Creating Client Certificates"
    # Generate Client Key JKS File
    keytool -genkeypair -alias sdk-client -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "keystore/sdk-client.jks" -storepass tcxsdk -keypass tcxsdk -noprompt
    # Export Client Key to .cer File
    keytool -exportcert -alias sdk-client -keystore "keystore/sdk-client.jks" -file "keystore/sdk-client.cer" -storepass tcxsdk -noprompt
    # Convert Client JKS to PKCS12
    keytool -importkeystore -srckeystore "keystore/sdk-client.jks" -destkeystore "keystore/sdk-client.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt
    # Extract Client Key using OpenSSL
    openssl pkcs12 -in "keystore/sdk-client.p12" -nocerts -nodes -out "keystore/sdk-client.key" -passin pass:tcxsdk
    # Create PEM File from Client Key
    openssl rsa -in "keystore/sdk-client.key" -out "keystore/sdk-client.pem"
    
    echo "Creating Server Certificates"
    # Generate Server Key JKS File
    keytool -genkeypair -alias sdk-wss -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "keystore/sdk-wss.jks" -storepass tcxsdk -keypass tcxsdk -noprompt
    # Export Server Key to .cer File
    keytool -exportcert -alias sdk-wss -keystore "keystore/sdk-wss.jks" -file "keystore/sdk-wss.cer" -storepass tcxsdk -noprompt
    # Convert Server JKS to PKCS12
    keytool -importkeystore -srckeystore "keystore/sdk-wss.jks" -destkeystore "keystore/sdk-wss.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt
    # Extract Server Key using OpenSSL
    openssl pkcs12 -in "keystore/sdk-wss.p12" -nocerts -nodes -out "keystore/sdk-wss.key" -passin pass:tcxsdk
    # Create PEM File from Server Key
    openssl rsa -in "keystore/sdk-wss.key" -out "keystore/sdk-wss.pem"

    cp -r keystore/ /mnt/f/adxetc/ext/adxqrsdk/conf/
fi

process=$(ps aux | grep java | grep SDK_HOME | sed -E 's/\s+/,/g' | cut -d, -f2)
kill -9 $process
sleep 1
ps aux | grep java
