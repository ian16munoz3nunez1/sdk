@echo off

"%1\java.msi"

setx /m JAVA_HOME "C:\Program Files\ojdkbuild\java-1.8.0-openjdk-1.8.0.332-1"

"%1\upos.exe"
