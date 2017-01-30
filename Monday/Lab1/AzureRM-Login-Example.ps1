<#

Here's an example of how to authenticate the Azure RM module
without interactive login.

Note: You must be using an Azure AD account for this to work, MS login is not supported

You can export your encrypted password to disk using the following:

$cred = Get-Credential
$cred.GetNetworkCredential().SecurePassword | 
    ConvertFrom-SecureString | Out-File -FilePath .\password.txt

#>

#your azure ad account
$username = 'dave@sometenant.onmicrosoft.com'

#read encrypted password in from disk
$pass = Get-Content .\password.txt | ConvertTo-SecureString

#create the credential object
$credential = New-Object pscredential -ArgumentList $username, $pass

#login to azure
$profile = Login-AzureRmAccount -Credential $credential

#you can then save your profile
Save-AzureRmProfile -Profile $profile -Path $env:USERPROFILE\profile.json

#you could then use the profile to login
Select-AzureRmProfile -Profile C:\Users\sysadmin\profile.json