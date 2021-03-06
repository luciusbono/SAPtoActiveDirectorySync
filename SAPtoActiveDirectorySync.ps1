param($SAPdata, $backupPath = [Environment]::GetFolderPath("Desktop")+'\'+'BackupData-'+(Get-Date -format M-d-yyyy)+'.csv')

#First, back up all the users who will be changed
$(Foreach ($SAPuser in $SAPdata)
{
	Get-ADUser $SAPuser.samaccountname -Properties samaccountname, Department, Division, extensionAttribute5, title, office, manager
}) | select samaccountname, Department, Division, extensionAttribute5, title, office, manager | Export-Csv $backupPath -NoTypeInformation

If (Test-Path $backupPath) { 
	Write-Host -NoNewline `n"A backup of users to be changed was created:" `n `n $backupPath `n `n
}

#Then, write changes to AD
Foreach ($SAPuser in $SAPdata)
{
	Get-ADUser -Identity $SAPuser.samaccountname | Set-ADUser -Replace @{Department=$SAPuser.'SAP Department';Division=$SAPuser.'SAP Division';extensionAttribute5=$SAPuser.'SAP extensionAttribute5';title=$SAPuser.'SAP title';physicaldeliveryofficename=$SAPuser.'SAP office';manager=(Get-ADUser $SAPuser.'SAP Manager').distinguishedname}
}