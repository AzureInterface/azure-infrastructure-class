<#

Windows Server post sysprep command examples

NOTE: this is just an example, you'll need to define your variables, etc.

#>
Stop-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName
Set-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName -Generalized
Save-AzureRmVMImage -ResourceGroupName $resourceGroup -Name $vmName -DestinationContainerName "vm-images" -VHDNamePrefix "win-web-app" -Path "win-web-app.json"
