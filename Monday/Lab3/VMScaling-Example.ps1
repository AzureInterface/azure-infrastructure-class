<#

This script is not intended to be run
these are just example commands for:

-Scaling to a larger VM size
-Resizing the OS disk
-Adding an SSD data disk

#>

$resourceGroup = 'Your resource group name'
$vmName = 'Your VM name'

#NOTE: to scale up to a different VM series you must shut the VM down first
Stop-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName
$vm = Get-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName
$vm.HardwareProfile.VmSize = 'Standard_DS1'
Update-AzureRmVM -ResourceGroupName $resourceGroup -VM $vm
Start-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName

#Resizing the OS disk
Stop-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName
$vm.StorageProfile.OsDisk.DiskSizeGB = 1000
Update-AzureRmVM -ResourceGroupName $resourceGroup -VM $vm
Start-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName

<#

To add an SSD data disk to the vm, first we need to add a premium storage account
Also make sure you've changed the VM series to DS, DSv2 or GS

#>

Stop-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName

$ssdStorage = New-AzureRmStorageAccount -ResourceGroupName $resourceGroup -Name 'change-this' -Type Premium_LRS -Location 'west us'

$dataDiskParams = @{
    VM = $vm
    Name = 'New-SSD-Data-Disk2'
    VhdUri = $ssdStorage.PrimaryEndpoints.Blob.ToString() + 'vhds/New-SSD-Data-Disk2.vhd'
    Lun = 1
    Caching = 'ReadOnly'
    DiskSizeInGB = 1000
    CreateOption = 'Empty'
}

Add-AzureRmVMDataDisk @dataDiskParams
Update-AzureRmVM -ResourceGroupName $resourceGroup -VM $vm
Start-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName
