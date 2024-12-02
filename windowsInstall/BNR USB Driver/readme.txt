April 16th, 2019

Welcome to the new BNR WinUSB driver
------------------------------------

This README file contains important information about BNR WinUSB driver.


----------------------------------------------
TABLE OF CONTENTS
----------------------------------------------
 1. MINIMUM SYSTEM REQUIREMENTS
 2. HOW TO GET HELP
 3. BNR WinUSB driver INSTALLATION
 4. BNR WIN USB DRIVER RELEASE NOTES
 5. INSTALLER RELEASE NOTES
 6. COPYRIGHTS
 7. COMPATIBILITY

----------------------------------------------
 1. MINIMUM SYSTEM REQUIREMENTS
----------------------------------------------

  o Windows XP Professional Edition Service Pack 2 / Windows 7 / Windows 8 / Windows Embedded POSReady 7
  o Celeron 600 MHz or better processor
  o 20MB of system memory available for the API
  o A full installation of BNR WinUSB driver requires approximately 30 Mbytes of hard disk space free.

BNR WinUSB driver allows silent installation. It has been tested under Windows XP Professional Service Pack 2, Windows 7, Windows 8 , Windows Embedded POSReady 7.

----------------------------------------------
 2. HOW TO GET HELP
----------------------------------------------
If you have any problems with this product, there are a number documents that may contain the information you need:

  o This README file


If you still have a question and need assistance, help is available from the following source:

  o For information about installation, assistance beyond product installation, system configuration, and compatibility, call the CPI Customer Support at:

         CPI Inc.
         Technical Support
         P.O. Box 2650
         CH-1211 Geneva 2
         Tel: +41 (0) 22 884 05 05
         Fax: +41 (0) 22 884 05 04
         http://www.meigroup.com

----------------------------------------------
 3. BNR WinUSB driver INSTALLATION
----------------------------------------------
To install the BNR WinUSB driver simply run the installer setupBNRWinUSBDriver.exe

If a previous version of the BNR USB driver was already installed, please first uninstall it.

----------------------------------------------
 4. BNR WIN USB DRIVER RELEASE NOTES
----------------------------------------------

    This chapter describes the most important changes from the last release of the BNR WinUSB driver.

    Version 2.1.1
    =============

      Fixs:
      -------------
      o USBOpenDevice (megWinUsb.dll) : fix access to invalid handle that led crash in some situation.


    Version 2.1.0
    =============

      Improvements:
      -------------
      o BNR Disconnection simulation under x64 architecture
      o BNR Disconnection simulation without administrator rights

    Version 2.0.0
    =============

      Improvements:
      -------------
      o New driver for the BNR, based on Microsoft WinUSB driver.
      o Compatible with 32 and 64 bits platforms.

    Version 1.xx
    ============

      Old kernel driver for the BNR.
	  
----------------------------------------------
 5. INSTALLER RELEASE NOTES
----------------------------------------------

    This chapter describes the most important changes from the last release of the driver installer.

    Version 1.1.4
    ============
	  
	  Features and/or Improvements:
	  -----------------------------
	  o Install 2.1.1 BNR WinUSB driver.


    Version 1.1.3
    ============
	  
	  Features and/or Improvements:
	  -----------------------------
	  o Install 2.1.0 BNR WinUSB driver.
	  o Abort installation for version below Windows XP SP2.
	  o Remove the process that check the presence of the WinUSB driver for version below Windows 7 (because this process is not relevant for theses versions).
	  o Fix issue in the process that check the presence of the WinUSB driver that led installation failure for version above Windows 7.
	  o Renew CPI Certificate for digital signature with validity period from 27/02/2018 to 26/04/2021.
	
    Version 1.1.2
    ============
	  
	  Features and/or Improvements:
	  -----------------------------
	  o Install 2.1.0 BNR WinUSB driver.
	  o Improve the process that check the presence of the WinUSB driver.
	  o Renew CPI Certificate for digital signature with validity period from 03/03/2016 to 03/05/2018.
	
    Version 1.1.1
    ============
	  
	  Features and/or Improvements:
	  -----------------------------
	  o Install 2.1.0 BNR WinUSB driver.
	  o Abort installation if WinUSB driver is not present and pop-up a message box.
	  o Update silent install batch to not pop-up message.
	  o Update installer info with CPI copyright.


    Version 1.1.0
    ============
	  
	  Features and/or Improvements:
	  -----------------------------
	  o Install 2.1.0 BNR WinUSB driver.
	  o Update installation process to support Windows 8.
	  o Improve silent uninstall script.
	  o Renew CPI Certificate for digital signature with validity period from 08/01/2013 to 10/04/2015.

    Version 1.0.0
    ============

      First release
	  
	  Features and/or Improvements:
	  -----------------------------
	  o Install 2.0.0 BNR WinUSB driver.
	  o Installer binary is signed (to allow silent installation) using CPI Certificate with validity period from 31/01/2011 to 24/02/2013.
	  
      

----------------------------------------------
 6. COPYRIGHTS
----------------------------------------------

© 2015 Crane Payment Innovations, Inc. All rights reserved.
Decompilation prohibited except as permitted by law. No using, disclosing, reproducing, accessing or modifying without prior written consent.

----------------------------------------------
 7. COMPATIBILITY
----------------------------------------------

The libraries using the BNR USB driver like Win32 API or Java API, need to be adapted to use the new driver. Please, refer to these products for more information.

Using this new driver does not automatically imply to rework the applications using BNR APIs.

It is not possible to have the 2 driver versions installed on the same machine at the same time.


--------------------------------- END ----------------------------------
