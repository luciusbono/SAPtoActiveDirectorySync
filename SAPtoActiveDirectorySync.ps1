$SAPdata = Import-Csv trunc.csv 

#do a for-each against samaccountname and back up all relevant attributes at the begining of the script

Foreach ($SAPuser in $SAPdata)
{
	$ADuser = Get-ADUser $SAPuser.samaccountname -Properties department
	
	if ($ADuser.Department -eq $SAPuser.'SAP Department'){
		Write-Output 'AD is ' $ADuser.Department 'SAP is ' $SAPuser.'SAP Department'
	}
	Else {
		Write-Output 'AD is ' $ADuser.Department 'SAP is ' $SAPuser.'SAP Department'
	}


}