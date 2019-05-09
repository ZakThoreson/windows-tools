#Set the Export-CSV Function to include the user of the script's Username 
#Output will land on the desktop 
$paramhash=@{
UsersOnly = $True
AccountInactive = $True
# Modify the number of days to check, 60, 90, 120
Timespan = New-Timespan -Days 60
# To restrict the script to only search a specific OU, i.e 'Employees' include 'Searchbase'
# Searchbase = "ou=Employees,dc=[name]" 
}

Search-ADAccount @paramhash | 
Get-ADuser -Properties Description,Department,Title,LastLogonDate,WhenChanged |
sort LastLogonDate |
Select Name,Department,Title,Description,WhenChanged,LastLogonDate,DistinguishedName|
export-csv c:\Users\USER\Desktop\UnusedAccounts.csv -NoTypeInformation