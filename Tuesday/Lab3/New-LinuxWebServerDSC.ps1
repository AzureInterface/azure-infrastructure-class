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

Set-AzureRmVMExtension -ResourceGroupName $resourceGroup -VMName linux1 -Location westus `
                       -Name $extensionName -Publisher $publisher -ExtensionType $extensionName `
                       -TypeHandlerVersion $version -SettingString $publicConfig -ProtectedSettingString $privateConfig