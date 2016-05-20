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
    $ConfigurationName,

    [Parameter(Mandatory=$true)]
    $SourceImageUri
)

$extensionName = 'DSCForLinux'
$publisher = 'Microsoft.OSTCExtensions'
$version = '2.0'

$publicConfig = '{
  "Mode": "Push",
  "FileUri": "https://mydemorg5551.blob.core.windows.net/linux-dsc/localhost.mof"
}'

$privateConfig = '{
  "StorageAccountName": "mydemorg5551",
  "StorageAccountKey": "3LBjfiSCBYZsh67lovlKiD+CB8jgzDkNsuDLFg5F6RmhG4h+XOkAE4GjtR29z3Tkx6JqC4J9Zy+T4MqVVu3SbQ=="
}'

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