#Note: make sure you update the file url, storage account name, storage account key, and VMname

$extensionName = 'DSCForLinux'
$publisher = 'Microsoft.OSTCExtensions'
$version = '2.0'

$publicConfig = '{
  "Mode": "Push",
  "FileUri": "https://myserversdiag761.blob.core.windows.net/linux-dsc/localhost.mof"
}'

$privateConfig = '{
  "StorageAccountName": "myserversdiag761",
  "StorageAccountKey": "2wR1Dv58HDRyUjZB/Lx3Q1DzmFTX5hSyZdtBWjtjlq0UAH7OuqnkyUuimc1RcddcWTWNFhRocfcyBmnVkCt8SQ=="
}'

Set-AzureRmVMExtension -ResourceGroupName myservers `
-VMName linux -Location westus -Name $extensionName `
-Publisher $publisher -ExtensionType $extensionName `
-TypeHandlerVersion $version -SettingString $publicConfig `
-ProtectedSettingString $privateConfig
