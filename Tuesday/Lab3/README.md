# Lab 3 - Deploy an AD DS Domain Controller and use Domain Join Extention to add new servers to the domain

1. Launch the AD Domain Controller ARM template from [here](https://github.com/AzureInterface/quickstart/tree/master/activedirectory)
2. Launch a new Windows server into the same resource group / vnet as the domain controller
3. Make sure your new VM can resolve DNS against the domain controller
4. Use the Azure joindomain extention to join the server to your AD domain (see Join-AzureVmDomain.ps1 in this repo)
5. Delete the resource group from your Azure Pass subscription when complete

### Notes

Azure ARM: VM Domain Join to Active Directory Domain with "JoinDomain" Extension
* https://blogs.msdn.microsoft.com/igorpag/2016/01/25/azure-arm-vm-domain-join-to-active-directory-domain-with-joindomain-extension/

