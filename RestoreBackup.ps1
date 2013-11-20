$BackupData = Import-Csv c:\users\lbono\Documents\github\SAPtoActiveDirectorySync\backup.csv 

#Revert changes via backup file
Foreach ($BackupUser in $BackupData)
{
	Get-ADUser -Identity $BackupUser.samaccountname | Set-ADUser -Replace @{Department=$BackupUser.Department;Division=$BackupUser.Division;extensionAttribute5=$BackupUser.extensionAttribute5;title=$BackupUser.title}
}