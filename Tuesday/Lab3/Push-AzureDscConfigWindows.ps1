[CmdletBinding()]
Param (
    [Parameter(Mandatory=$true)]
    $VMName,

    [Parameter(Mandatory=$true)]
    $ResourceGroupName,

    [Parameter(Mandatory=$true)]
    $ConfigurationPath,

    [Parameter(Mandatory=$true)]
    $StorageAccountName,

    [Parameter(Mandatory=$true)]
    $ConfigurationName
)

$dscConfigParams = @{
    ConfigurationPath = $ConfigurationPath
    ResourceGroupName = $ResourceGroupName
    StorageAccountName = $StorageAccountName
}

Publish-AzureRmVMDscConfiguration @dscConfigParams

$archiveBlob = $ConfigurationPath.Split('\')[1] + ".zip"

$dscExtParams = @{
    ResourceGroupName = $ResourceGroupName
    VMName = $VMName
    Version = '2.15'
    ArchiveBlobName = $archiveBlob
    ArchiveStorageAccountName = $StorageAccountName
    ConfigurationName = $ConfigurationName
    WmfVersion = '4.0'
}

Set-AzureRmVMDscExtension @dscExtParams