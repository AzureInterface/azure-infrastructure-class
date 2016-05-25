$extensionName = 'DSCForLinux'
$publisher = 'Microsoft.OSTCExtensions'
$version = '2.0'

$publicConfig = '{
  "Mode": "Push",
  "FileUri": "https://webservers6120.blob.core.windows.net/linux-dsc-public/localhost.mof"
}'

Set-AzureRmVMExtension -ResourceGroupName $resourceGroup `
-VMName web5 -Location westus -Name $extensionName `
-Publisher $publisher -ExtensionType $extensionName `
-TypeHandlerVersion $version -SettingString $publicConfig