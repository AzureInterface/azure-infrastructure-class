# Lab 3 - Change VM Size, Resize the OS Disk, Add Data Disks

Create a new Windows VM in the portal and perform the following tasks:

1. Scale up to a larger VM size
2. Shutdown your VM and increase the OS disk size to 1 TB
3. Add two data disks to your VM each 1 TB in size
4. Bonus: Connect to the VM and run the PowerShell script in this repo (New-DataDiskStripeSet.ps1) to create a 2 TB volume in Windows

### Notes:

Resize virtual machines
* https://azure.microsoft.com/en-us/blog/resize-virtual-machines/

How to expand the OS drive of a Virtual Machine in an Azure Resource Group
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/expand-os-disk

How to attach a data disk to a Windows VM in the Azure portal
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/attach-disk-portal

Azure Disk Striping
* https://docs.microsoft.com/en-us/azure/storage/storage-premium-storage-performance#disk-striping
