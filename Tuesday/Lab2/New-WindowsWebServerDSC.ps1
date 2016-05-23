<#

Here's an example of how to manually run the cmdlets to push a DSC config to an Azure VM running Windows

#>

Publish-AzureRmVMDscConfiguration -ConfigurationPath d:\WindowsWebServer.ps1 -ResourceGroupName YourRGName -StorageAccountName YourSAName
Set-AzureRmVMDscExtension -ResourceGroupName YourRGName -VMName YourVMName -Version '2.15' -ArchiveBlobName 'WindowsWebServer.ps1.zip' -ArchiveStorageAccountName YourSAName -WmfVersion 4.0 -ConfigurationName WindowsWebServer