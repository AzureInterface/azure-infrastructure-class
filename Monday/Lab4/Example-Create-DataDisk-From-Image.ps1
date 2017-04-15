#adding a data disk to a VM that was captured as part of Save-AzureRmVMImage
$vm = Get-AzureRmVM -Name web2 -ResourceGroupName webservers

$dataDiskname = 'web2-data-disk'
$storageaccount = Get-AzureRmStorageAccount -Name webservers4685 -ResourceGroupName webservers

$params = @{
    Name = 'web2-data-disk'
    VM = $vm
    VhdUri = $StorageAccount.PrimaryEndpoints.Blob.ToString() + "vhds/$dataDiskname.vhd"
    SourceImageUri = 'https://webservers4685.blob.core.windows.net/system/Microsoft.Compute/Images/vhd-images/web1-dataDisk-0.6e4fc2a6-8ba5-403e-920e-ecd519c02d2f.vhd'
    CreateOption = 'FromImage'
    DiskSizeInGB = 1023
}

Add-AzureRmVMDataDisk @params

Update-AzureRmVM -VM $vm -ResourceGroupName webservers
