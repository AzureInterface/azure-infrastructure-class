<#
  Here's an example of how you might do lab2 with AzureRM PowerShell
#>

New-AzureRmResourceGroup -Name MyServers -Location WestUs

New-AzureRmStorageAccount -ResourceGroupName MyServers `
-AccountName mikepf20172 `
-Location westus `
-SkuName standard_lrs `
-Kind storage

New-AzureRmResourceGroup -Name MyServers2 -Location WestUs

Get-AzureRmResource -ResourceName mikepf20172 -ResourceGroupName MyServers | 
  Move-AzureRmResource -DestinationResourceGroupName MyServers2
