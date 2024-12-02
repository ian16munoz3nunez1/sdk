#!/bin/bash

if [[ ! -d $1 ]];
then
    mkdir -p $1
fi

# Generate Client Key JKS File
keytool -genkeypair -alias sdk-client -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "$1/sdk-client.jks" -storepass tcxsdk -keypass tcxsdk -noprompt

# Export Client Key to .cer File
keytool -exportcert -alias sdk-client -keystore "$1/sdk-client.jks" -file "$1/sdk-client.cer" -storepass tcxsdk -noprompt

# Convert Client JKS to PKCS12
keytool -importkeystore -srckeystore "$1/sdk-client.jks" -destkeystore "$1/sdk-client.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt

# Extract Client Key using OpenSSL
openssl pkcs12 -in "$1/sdk-client.p12" -nocerts -nodes -out "$1/sdk-client.key" -passin pass:tcxsdk

# Create PEM File from Client Key
openssl rsa -in "$1/sdk-client.key" -out "$1/sdk-client.pem"
