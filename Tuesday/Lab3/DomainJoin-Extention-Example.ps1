<#

https://blogs.msdn.microsoft.com/igorpag/2016/01/25/azure-arm-vm-domain-join-to-active-directory-domain-with-joindomain-extension/

NOTE: Make sure your VM can resolve AD DNS or else this won't work!

#>

$setting = '{ 
   "Name": "example.com", 
   "User": "example.com\\sysadmin", 
   "Restart": "true", 
   "Options": "3" 
}'

$pass = '{ "Password": "P@ssw0rd01" }'

$extParams = @{
    ResourceGroupName = 'ADRG'
    ExtensionType = 'JsonADDomainExtension'
    Name = 'joindomain'
    Publisher = 'Microsoft.Compute'
    TypeHandlerVersion = '1.3'
    VMName = 'MemberServer'
    Location = 'westus'
    SettingString = $setting
    ProtectedSettingString = $pass
}


Set-AzureRmVMExtension @extParams
