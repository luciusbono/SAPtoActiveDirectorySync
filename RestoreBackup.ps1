param($backupPath)

#Remove this after testing complete
$backupPath = 'c:\users\lbono\Documents\github\SAPtoActiveDirectorySync\backup.csv' 

#Revert changes via backup file
$BackupData = Import-Csv $backupPath

Foreach ($BackupUser in $BackupData)
{
	Get-ADUser -Identity $BackupUser.samaccountname | Set-ADUser -Replace @{Department=$BackupUser.Department;Division=$BackupUser.Division;extensionAttribute5=$BackupUser.extensionAttribute5;title=$BackupUser.title;physicaldeliveryofficename=$BackupUser.office;manager=(Get-ADUser $BackupUser.manager).distinguishedname}
}