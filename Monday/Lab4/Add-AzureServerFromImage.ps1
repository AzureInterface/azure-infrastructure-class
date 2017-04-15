[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true)]
    $VMName,

    [Parameter(Mandatory=$true)]
    $ResourceGroupName,

    [Parameter(Mandatory=$false)]
    $Location = 'West Us',

    [Parameter(Mandatory=$true)]
    $StorageAccountName,

    [Parameter(Mandatory=$true)]
    $VNetName,

    [Parameter(Mandatory=$true)]
    $SubnetName,

    [System.Management.Automation.PSCredential]
    [Parameter(Mandatory=$true)]
    $Credential,

    [Parameter(Mandatory=$true)]
    $SourceImageUri
)

Write-Verbose "Getting Storage Account"
$storageAccount = Get-AzureRmStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName

$nicName = "$VMName-NIC1"

$publicIpParams = @{
    Name = $nicName
    ResourceGroupName = $ResourceGroupName
    Location = $Location
    AllocationMethod = 'Dynamic'
}

Write-Verbose "Creating public ip config"
$publicIP = New-AzureRmPublicIpAddress @publicIpParams

$vnetObj = Get-AzureRmVirtualNetwork -Name $VNetName -ResourceGroupName $ResourceGroupName
$subnetObj = Get-AzureRmVirtualNetworkSubnetConfig -VirtualNetwork $vnetObj -Name $SubnetName

$nicParams = @{
    Name = $nicName
    ResourceGroupName = $ResourceGroupName
    Location = $Location
    SubnetId = $subnetObj.Id
    PublicIpAddressId = $publicIP.Id
}

Write-Verbose "Creating network interface config"
$nic = New-AzureRmNetworkInterface @nicParams

Write-Verbose 'Creating vm config'
$vm = New-AzureRmVMConfig -VMName $VMName -VMSize 'Standard_DS2_v2'

$osParams = @{
    VM = $vm
    Windows = $true
    ComputerName = $VMName
    Credential = $Credential
    ProvisionVMAgent = $true
    EnableAutoUpdate = $true
}

Write-Verbose 'Setting OS image config'
$vm = Set-AzureRmVMOperatingSystem @osParams

Write-Verbose 'Adding network interface to VM'
$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $nic.Id

$osDiskName = "$VMName-OS-DISK"

$osDiskParams = @{
    Name = $osDiskName
    VM = $vm
    VhdUri = $StorageAccount.PrimaryEndpoints.Blob.ToString() + "vhds/$osDiskName.vhd"
    SourceImageUri = $SourceImageUri
    CreateOption = 'FromImage'
    Windows = $true
}

$vm = Set-AzureRmVMOSDisk @osDiskParams

Write-Verbose 'Creating VM'
New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $Location -VM $vm
