[CmdletBinding()]
Param (
    [string]
    [Parameter(Mandatory=$true,
        HelpMessage = "Enter the name for your virtual machine"
    )]
    $VMName,

    [string]
    [Parameter(Mandatory=$true,
        HelpMessage = "Enter an existing resource group name"
    )]
    $ResourceGroupName,

    [string]
    [Parameter(Mandatory=$true,
        HelpMessage = "Enter an existing storage account name"
    )]
    $StorageAccountName,

    [string]
    [Parameter(Mandatory=$false,
        HelpMessage = "Provide a valid VM size for your VM"
    )]
    $VMSize = 'Standard_A1',

    [System.Management.Automation.PSCredential]
    [Parameter(Mandatory=$true,
        HelpMessage = "Enter a username/password for your VM"
    )]
    $Credential
)

$RG = Get-AzureRmResourceGroup -Name $ResourceGroupName
$nicName = "$VMName-NIC1"

$publicIpParams = @{
    Name = $nicName
    ResourceGroupName = $RG.ResourceGroupName
    Location = $RG.Location
    AllocationMethod = 'Dynamic'
}

$publicIP = New-AzureRmPublicIpAddress @publicIpParams

$vnet = Get-AzureRmVirtualNetwork -ResourceGroupName $RG.ResourceGroupName

$nicParams = @{
    Name = $nicName
    ResourceGroupName = $RG.ResourceGroupName
    Location = $RG.Location
    SubnetId = $vnet.Subnets[0].Id
    PublicIpAddressId = $publicIP.Id
}

$nic = New-AzureRmNetworkInterface @nicParams

$storageParams = @{
    Name = $StorageAccountName
    ResourceGroupName = $RG.ResourceGroupName
}

$storageAccount = Get-AzureRmStorageAccount @storageParams

$vm = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize

$osParams = @{
    VM = $vm
    Windows = $true
    ComputerName = $VMName
    Credential = $Credential
    ProvisionVMAgent = $true
    EnableAutoUpdate = $true
}

$vm = Set-AzureRmVMOperatingSystem @osParams

$sourceImageParams = @{
    VM = $vm
    PublisherName = 'MicrosoftWindowsServer'
    Offer = 'WindowsServer'
    Skus = '2012-R2-Datacenter'
    Version = 'latest'
}

$vm = Set-AzureRmVMSourceImage @sourceImageParams

$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id

$osDiskName = "$VMName-OS-DISK"

$osDiskParams = @{
    Name = $osDiskName
    VM = $vm
    VhdUri = $StorageAccount.PrimaryEndpoints.Blob.ToString() + "vhds/$osDiskName.vhd"
    CreateOption = 'FromImage'
}

$vm = Set-AzureRmVMOSDisk @osDiskParams

New-AzureRmVM -ResourceGroupName $RG.ResourceGroupName -Location $RG.Location -VM $vm