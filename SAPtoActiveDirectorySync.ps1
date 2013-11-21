$SAPdata = Import-Csv c:\users\lbono\Documents\github\SAPtoActiveDirectorySync\trunc.csv 

#First, back up all the users who will be changed
$(Foreach ($SAPuser in $SAPdata)
{
	Get-ADUser $SAPuser.samaccountname -Properties samaccountname, Department, Division, extensionAttribute5, title, office, manager
}) | select samaccountname, Department, Division, extensionAttribute5, title, office, manager | Export-Csv c:\Users\lbono\Documents\GitHub\SAPtoActiveDirectorySync\backup.csv -NoTypeInformation

#Then, write changes to SAP
Foreach ($SAPuser in $SAPdata)
{
	Get-ADUser -Identity $SAPuser.samaccountname | Set-ADUser -Replace @{Department=$SAPuser.'SAP Department';Division=$SAPuser.'SAP Division';extensionAttribute5=$SAPuser.'SAP extensionAttribute5';title=$SAPuser.'SAP title';physicaldeliveryofficename=$SAPuser.'SAP office';manager=(Get-ADUser $SAPuser.'SAP Manager').distinguishedname}
}