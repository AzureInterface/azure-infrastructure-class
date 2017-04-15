# Lab 4 - Capture and Deploy a Custom VM Image

Create a new Windows VM in the Azure Portal (make sure you use managed disks) and perform the following tasks:

1. Customize the server (install Chrome or Firefox)
2. Run sysprep to generalize the server (run sysprep.exe)
3. Use the "Capture" button in the Azure Portal to capture an image of your VM
4. Deploy a new server with your image into the existing resource group
5. Verify you can connect to your new VM and the customizations are present
5. Delete all resource groups from your Azure Pass subscription when complete

### Notes:

Generalize a Windows virtual machine using Sysprep
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/generalize-vhd?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json

Capture a managed image of a generalized VM in Azure
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/capture-image-resource?toc=%2fazure%2fvirtual-machines%2fwindows%2ftoc.json

Create a VM from a generalized managed VM image
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/create-vm-generalized-managed

How to capture an UNMANAGED VM image from a generalized Azure VM
* https://docs.microsoft.com/en-us/azure/virtual-machines/windows/capture-image