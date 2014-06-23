SAPtoActiveDirectorySync
========================

A script that analyzes a specially crafted CSV file that contains both AD and SAP data and write the deltas to Active Directory.

USAGE -- SAPtoActiveDirectorySync [input CSV path][OPTIONAL: Backup file path]

REQUIREMENTS: 
Powershell 2.0 or above (including in Windows 7 and Windows 8/8.1).
Active Directory Users and Computers, or Remote Server Administration Tools

RSAT for Windows 8.1:
http://www.microsoft.com/en-us/download/details.aspx?id=39296

RSAT for Windows 8:
http://www.microsoft.com/en-us/download/details.aspx?id=28972

RSAT for Windows 7:
http://www.microsoft.com/en-us/download/details.aspx?id=7887

This script takes an input CSV file with specific user attributes in it, which is exported from a system (in this case SAP) and writes those attributes to AD objects. This is designed to 'true up' descrepencies between two data systems (in this case: SAP and AD). The script does not discriminate, so it is important that the input file contains only the changes that are to be made. A more advanced version of the script would check to see if a change needs to be made and only write data if there is a discrepency. 

The script also backs up the attributes that it changes, the usage is as follows:

restoreBackup [input CSV Path]

This script can be easily modified to do other bulk changes.
