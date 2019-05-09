#Script will output all users on the local machine and include their current status and security settings
#Output will be saved to the desktop, update the user field to user logged in on the machine
WmiObject -Class Win32_UserAccount -Filter "LocalAccount='True'" |
	Select PSComputername, Name, Status, Disabled, AccountType, Lockout, PasswordRequired, PasswordChangeable, SID |
	Export-Csc -path C:\Users\USER\Desktop\test.csv -NoTypeInformation