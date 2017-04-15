<#

Example of how to run Add-AzureServerFromImage.ps1

#>

$Credential = Get-Credential

$params = @{
    VMName = 'Server5'
    ResourceGroupName = 'MyServerFarm'
    StorageAccountName = '44551481'
    VNetName = 'MyServerFarm-vNET'
    SubnetName = 'MyServerFarm-Subnet'
    SourceImageUri = 'https://44551481.blob.core.windows.net/system/Microsoft.Compute/Images/custom-images/v1-osDisk.d07f78fd-d77a-42e6-a95b-a6fa254fdb45.vhd'
    Credential = $Credential
    Verbose = $true
}

C:\Users\sysadmin\Desktop\Add-AzureServerFromImage.ps1 @params