#!/bin/bash

if [[ ! -d $1 ]];
then
    mkdir -p $1
fi

# Generate Server Key JKS File
keytool -genkeypair -alias sdk-wss -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "$1/sdk-wss.jks" -storepass tcxsdk -keypass tcxsdk -noprompt

# Export Server Key to .cer File
keytool -exportcert -alias sdk-wss -keystore "$1/sdk-wss.jks" -file "$1/sdk-wss.cer" -storepass tcxsdk -noprompt

# Convert Server JKS to PKCS12
keytool -importkeystore -srckeystore "$1/sdk-wss.jks" -destkeystore "$1/sdk-wss.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt

# Extract Server Key using OpenSSL
openssl pkcs12 -in "$1/sdk-wss.p12" -nocerts -nodes -out "$1/sdk-wss.key" -passin pass:tcxsdk

# Create PEM File from Server Key
openssl rsa -in "$1/sdk-wss.key" -out "$1/sdk-wss.pem"
