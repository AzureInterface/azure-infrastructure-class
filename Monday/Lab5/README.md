# Lab 5 - Create Web Servers running in Azure

1. Use the Azure portal to launch a Windows Server and Ubuntu Server
2. Manually install a web server on each (IIS, Apache)
··* Windows = *Install-WindowsFeature web-server*
··* Linux = *sudo apt-get install apache2*
3. Modify your network security group rules to permit HTTP to both web servers and verify you can view a simple web page
4. Delete your resource group from your Azure Pass subscription when complete

### Notes:

Create a Windows virtual machine with the Azure portal
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-portal

Create a Linux virtual machine with the Azure portal
* https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal

Opening ports to a VM in Azure using the Azure portal
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/nsg-quickstart-portal