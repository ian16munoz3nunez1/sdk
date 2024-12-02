#!/bin/bash

if [[ ! -d $1 ]];
then
    mkdir -p $1
fi

# Generate CA Key JKS File
keytool -genkeypair -alias sdk-ca -keyalg RSA -keysize 2048 -dname "CN=localhost, O=Toshiba Global Commerce Solutions, OU=SDK development, L=Zapopan, ST=Jalisco, C=MX" -keystore "$1/sdk-ca.jks" -storepass tcxsdk -keypass tcxsdk -noprompt

# Export CA Key to .cer File
keytool -exportcert -alias sdk-ca -keystore "$1/sdk-ca.jks" -file "$1/sdk-ca.cer" -storepass tcxsdk -noprompt

# Convert CA JKS to PKCS12
keytool -importkeystore -srckeystore "$1/sdk-ca.jks" -destkeystore "$1/sdk-ca.p12" -deststoretype PKCS12 -srcstorepass tcxsdk -deststorepass tcxsdk -noprompt

# Extract CA Key using OpenSSL
openssl pkcs12 -in "$1/sdk-ca.p12" -nocerts -nodes -out "$1/sdk-ca.key" -passin pass:tcxsdk

# Create PEM File from CA Key
openssl rsa -in "$1/sdk-ca.key" -out "$1/sdk-ca.pem"
