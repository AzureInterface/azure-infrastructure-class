<#

Windows Server post sysprep command examples

NOTE: Save image in a seperate resource group / storage account 
dedicated for custom images

#>
Stop-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName
Set-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName -Generalized
Save-AzureRmVMImage -ResourceGroupName $resourceGroup -Name $vmName -DestinationContainerName "vm-images" -VHDNamePrefix "win-web-app" -Path "win-web-app.json"