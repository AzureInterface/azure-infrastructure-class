<#

Note: Don't forget to update the resource group and storage account names.

#>



#upload the DSC archive to Azure Storage

Publish-AzureRmVMDscConfiguration -ConfigurationPath c:\WindowsWebServer.ps1 `
-ResourceGroupName myservers `
-StorageAccountName myserversdiag761

#Install the DSC extention and apply the config

Set-AzureRmVMDscExtension -ResourceGroupName myservers `
-VMName WinSrv -Version '2.15' `
-ArchiveBlobName 'WindowsWebServer.ps1.zip' `
-ArchiveStorageAccountName myserversdiag761 `
-WmfVersion 4.0 `
-ConfigurationName WindowsWebServer
