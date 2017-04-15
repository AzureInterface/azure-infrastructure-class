# Lab 2 - Create and connect to Azure Virtual Machines

1. Create a new resource group in the portal
2. Create a Windows Server and Ubuntu Server in your new resource group
3. Verify that you can connect via RDP and SSH to your servers
4. Delete the resource group
5. Review the code in the New-AzureServer.ps1 script. Create a new server using this script
6. Reset the admin password on one of your VMs and reconnect to ensure it worked
7. Delete all resource groups in your Azure Pass subscription when complete

Bonus: Download and run the script in this repository (New-AzureServer.ps1) to create a VM from PowerShell

### Notes:

Create a Windows virtual machine with the Azure portal
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-portal

Create a Linux virtual machine with the Azure portal
* https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal

Create a Windows virtual machine with PowerShell
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-powershell