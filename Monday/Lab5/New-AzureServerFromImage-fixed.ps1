﻿[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true)]
    $VMName,

    [Parameter(Mandatory=$true)]
    $ResourceGroupName,

    [Parameter(Mandatory=$false)]
    $Location = 'West Us',

    [Parameter(Mandatory=$true)]
    $StorageAccountName,

    [Parameter(Mandatory=$false)]
    $NetworkAddressPrefix = '10.0.0.0/16',

    [Parameter(Mandatory=$false)]
    $SubnetAddressPrefix = '10.0.1.0/24',

    [System.Management.Automation.PSCredential]
    [Parameter(Mandatory=$true)]
    $Credential,

    [Parameter(Mandatory=$true)]
    $SourceImageUri,

    [Parameter(Mandatory=$true)]
    $VMSize
)

Write-Verbose "Creating Resource Group"
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $Location

$subnetParams = @{
    Name = "$ResourceGroupName" + "-Subnet"
    AddressPrefix = $SubnetAddressPrefix
}

Write-Verbose "Creating new network subnet config"
$subnet = New-AzureRmVirtualNetworkSubnetConfig @subnetParams

$vnetParams = @{
    Name = "$ResourceGroupName" + "-vNET"
    ResourceGroupName = $ResourceGroupName
    Location = $Location
    AddressPrefix = $NetworkAddressPrefix
    Subnet = $subnet
}

Write-Verbose "Creating VNET"
$vnet = New-AzureRmVirtualNetwork @vnetParams

$nicName = "$VMName-NIC1"

$publicIpParams = @{
    Name = $nicName
    ResourceGroupName = $ResourceGroupName
    Location = $Location
    AllocationMethod = 'Dynamic'
}

Write-Verbose "Creating public ip config"
$publicIP = New-AzureRmPublicIpAddress @publicIpParams

$nicParams = @{
    Name = $nicName
    ResourceGroupName = $ResourceGroupName
    Location = $Location
    SubnetId = $vnet.Subnets[0].Id
    PublicIpAddressId = $publicIP.Id
}

Write-Verbose "Creating network interface config"
$nic = New-AzureRmNetworkInterface @nicParams

$VMParams = @{
    VMName = $VMName
    VMSize = $VMSize
}

Write-Verbose 'Creating vm config'
$vm = New-AzureRmVMConfig @VMParams

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